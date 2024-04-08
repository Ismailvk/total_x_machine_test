import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/utils/loading.dart';
import 'package:total_x/utils/snackbar.dart';
import 'package:total_x/view/home_screen/home_scree.dart';
import 'package:total_x/view/otp_screen/otp_screen.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetOptEvent>(getOtpEvent);
    on<VerifyButtonEvent>(verifyButtonEvent);
  }

  Future<void> getOtpEvent(GetOptEvent event, Emitter<LoginState> emit) async {
    try {
      LoadingController.showLoadingDialog(event.context);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${event.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          LoadingController.hideLoadingDialog(event.context);
          topSnackbar(event.context, error.code, AppColors.red);
        },
        codeSent: (String vid, int? token) {
          LoadingController.hideLoadingDialog(event.context);
          Navigator.of(event.context).push(
            MaterialPageRoute(
              builder: (context) =>
                  OtpScreen(phoneNumber: event.phoneNumber, vid: vid),
            ),
          );
        },
        codeAutoRetrievalTimeout: (vid) {},
      );
    } on FirebaseAuthException catch (e) {
      LoadingController.hideLoadingDialog(event.context);
      emit(GetOtpFailedState(exp: e.code));
    } catch (e) {
      LoadingController.hideLoadingDialog(event.context);
      emit(GetOtpFailedState(exp: e.toString()));
    }
  }

  Future<void> verifyButtonEvent(
      VerifyButtonEvent event, Emitter<LoginState> emit) async {
    try {
      LoadingController.showLoadingDialog(event.context);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.vid,
        smsCode: event.otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      LoadingController.hideLoadingDialog(event.context);
      Navigator.of(event.context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      LoadingController.hideLoadingDialog(event.context);
      emit(GetOtpFailedState(exp: e.code));
    } catch (e) {
      LoadingController.hideLoadingDialog(event.context);
      emit(GetOtpFailedState(exp: e.toString()));
    }
  }
}

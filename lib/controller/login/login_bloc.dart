import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetOptEvent>(getOtpEvent);
    on<VerifyButtonEvent>(verifyButtonEvent);
  }

  Future<void> getOtpEvent(GetOptEvent event, Emitter<LoginState> emit) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${event.phoneNumber}',
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print('completed');
        },
        verificationFailed: (FirebaseAuthException error) {
          print('*********************');
          print('error ${error.code}');
          emit(GetOtpFailedState(exp: error.code));
        },
        codeSent: (String vid, int? token) {
          print('vid $vid');
          emit(GetOtpSuccessState(vid: vid));
        },
        codeAutoRetrievalTimeout: (vid) {},
      );
    } on FirebaseAuthException catch (e) {
      print('***************************');
      print('auth error${e.code}');
      emit(GetOtpFailedState(exp: e.code));
    } catch (e) {
      print('error${e.toString()}');
      emit(GetOtpFailedState(exp: e.toString()));
    }
  }

  Future<void> verifyButtonEvent(
      VerifyButtonEvent event, Emitter<LoginState> emit) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: event.vid,
      smsCode: event.otp,
    );
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => emit(OtpVerifiedSuccessState()));
    } on FirebaseAuthException catch (e) {
      emit(GetOtpFailedState(exp: e.code));
    } catch (e) {
      emit(GetOtpFailedState(exp: e.toString()));
    }
  }
}

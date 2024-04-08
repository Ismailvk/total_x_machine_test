import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:total_x/controller/login/login_bloc.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/button_widget.dart';
import 'package:total_x/utils/snackbar.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String vid;
  OtpScreen({super.key, required this.phoneNumber, required this.vid});
  String otp = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('lib/images/Group.png')),
            SizedBox(height: size.height * 0.02),
            Text('OTP Verification', style: AppFonts.montesserateHeading),
            SizedBox(height: size.height * 0.02),
            Text(
              'Enter the verification code we just sent to your number +91 ********${phoneNumber.substring(phoneNumber.length - 2)}.',
              style: AppFonts.montesserateGrey,
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Pinput(
                      length: 6,
                      onChanged: (value) {
                        setState(() {
                          otp = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: size.width / 4),

              //timer

              child: RichText(
                text: TextSpan(
                  text: "Don't Get OTP?",
                  style: AppFonts.montesserateGrey,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' Resend',
                      style: TextStyle(color: AppColors.blueAnccent),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is GetOtpFailedState) {
                  topSnackbar(context, state.exp, AppColors.red);
                }
              },
              child: ButtonWidget(
                title: 'Verify',
                onPress: () {
                  if (otp.length < 6) {
                    return topSnackbar(context, 'Incorrect OTP', AppColors.red);
                  }
                  context.read<LoginBloc>().add(
                      VerifyButtonEvent(otp: otp, vid: vid, context: context));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

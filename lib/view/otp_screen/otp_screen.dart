import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/otp_textfield.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});

  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpTexfield(
                    controller: pin1, validator: (otp) => validOtp(otp!)),
                OtpTexfield(
                    controller: pin2, validator: (otp) => validOtp(otp!)),
                OtpTexfield(
                    controller: pin3, validator: (otp) => validOtp(otp!)),
                OtpTexfield(
                    controller: pin4, validator: (otp) => validOtp(otp!)),
                OtpTexfield(
                    controller: pin5, validator: (otp) => validOtp(otp!)),
                OtpTexfield(
                    controller: pin6, validator: (otp) => validOtp(otp!)),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: size.width / 4),
              child: RichText(
                text: TextSpan(
                  text: "Don't Get OTP?",
                  style: AppFonts.montesserateGrey,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' Resend',
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validOtp(String otp) {
    if (pin1.text.isEmpty &&
        pin2.text.isEmpty &&
        pin3.text.isEmpty &&
        pin4.text.isEmpty) {
      return '';
    }
    return null;
  }
}

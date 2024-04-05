import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/button_widget.dart';
import 'package:total_x/resources/widgets/textfield.dart';
import 'package:total_x/utils/validation.dart';
import 'package:total_x/view/otp_screen/otp_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
            Center(child: Image.asset('lib/images/OBJECTS.png')),
            SizedBox(height: size.height * 0.02),
            Text('Enter Phone Number', style: AppFonts.montesserateHeading),
            SizedBox(height: size.height * 0.02),
            Form(
              key: loginKey,
              child: MyTextField(
                isSufix: false,
                number: TextInputType.number,
                validator: (value) => Validations.isNumber(value),
                controller: phoneNumberController,
                hintText: 'Enter your Number',
              ),
            ),
            SizedBox(height: size.height * 0.02),
            RichText(
              text: TextSpan(
                text: 'By Continuing, I agree to TotalX’s',
                style: AppFonts.montesserateGrey,
                children: const <TextSpan>[
                  TextSpan(
                    text: ' Terms and condition & privacy policy',
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ButtonWidget(
              title: 'Get Otp',
              onPress: () {
                if (loginKey.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtpScreen(
                            phoneNumber: phoneNumberController.text,
                          )));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

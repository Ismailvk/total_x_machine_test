import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/add_user_circleavatar_widget.dart';
import 'package:total_x/resources/widgets/radio_button_widget.dart';
import 'package:total_x/resources/widgets/textfield.dart';

class BottotmSheets {
  static sortBottomSheet(
      BuildContext context, ValueNotifier<int> optionValueNotifier) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text('Sort', style: AppFonts.normalBold),
              ),
              RadioButtonWidget(
                  optionValueNotifier: optionValueNotifier,
                  title: 'All',
                  value: 1),
              RadioButtonWidget(
                  optionValueNotifier: optionValueNotifier,
                  title: 'Age: Elder',
                  value: 2),
              RadioButtonWidget(
                  optionValueNotifier: optionValueNotifier,
                  title: 'Age: Younger',
                  value: 3)
            ],
          ),
        );
      },
    );
  }

  // static void showCustomDialog(
  //     BuildContext context,
  //     TextEditingController nameController,
  //     TextEditingController ageController) {
  //   final size = MediaQuery.sizeOf(context);

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       String? imagePath;
  //       File? profileImage;
  //       return Dialog(
  //         child: Padding(
  //           padding: const EdgeInsets.all(12),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Add A New User', style: AppFonts.montesserateHeading),
  //               const SizedBox(height: 10),
  //               Stack(children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Container(
  //                       height: 90,
  //                       width: 90,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         gradient: LinearGradient(
  //                           colors: [
  //                             Colors.blue.shade200,
  //                             Colors.blue.shade700
  //                           ],
  //                           begin: Alignment.topCenter,
  //                           end: Alignment.bottomCenter,
  //                         ),
  //                       ),
  //                       child: const Icon(
  //                         Icons.person,
  //                         size: 70,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Positioned(
  //                   top: 10,
  //                   bottom: 0,
  //                   right: 105,
  //                   child: GestureDetector(
  //                       onTap: () async {
  //                         final pickedimage = await ImagePicker()
  //                             .pickImage(source: ImageSource.gallery);
  //                         if (pickedimage != null) {
  //                           File imagePicked = File(pickedimage.path);
  //                           imagePath = imagePicked.path;
  //                           setState(() {});
  //                         }
  //                       },
  //                       child: const HalfDisc()),
  //                 ),
  //                 Positioned(
  //                   right: size.width / 3,
  //                   bottom: 0,
  //                   child: const Icon(Icons.camera_alt_outlined,
  //                       color: AppColors.white),
  //                 )
  //               ]),
  //               Text('Name', style: AppFonts.montesserateGrey),
  //               const SizedBox(height: 10),
  //               MyTextField(
  //                   validator: (value) {},
  //                   controller: nameController,
  //                   hintText: 'Enter Name'),
  //               const SizedBox(height: 10),
  //               Text('Age', style: AppFonts.montesserateGrey),
  //               const SizedBox(height: 10),
  //               MyTextField(
  //                   validator: (value) {},
  //                   controller: ageController,
  //                   hintText: 'Enter Age'),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   TextButton(
  //                     onPressed: () {
  //                       // Handle cancel action
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text(
  //                       'Cancel',
  //                       style: TextStyle(color: AppColors.black),
  //                     ),
  //                   ),
  //                   ElevatedButton(
  //                     style: const ButtonStyle(
  //                         backgroundColor:
  //                             MaterialStatePropertyAll(Colors.blue)),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text(
  //                       'Save',
  //                       style: TextStyle(color: AppColors.white),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

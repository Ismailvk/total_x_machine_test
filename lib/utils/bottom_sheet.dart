import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:total_x/controller/user/user_bloc.dart';
import 'package:total_x/model/user_model.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/add_user_circleavatar_widget.dart';
import 'package:total_x/resources/widgets/textfield.dart';
import 'package:total_x/utils/snackbar.dart';
import 'package:total_x/utils/validation.dart';

class BottotmSheets {
  static sortBottomSheet(BuildContext context, int initialOptionValue) {
    int selectedValue = initialOptionValue;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 300,
              width: double.infinity,
              child: BlocListener<UserBloc, UserState>(
                listener: (context, state) {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Sort', style: AppFonts.normalBold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('All'),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: selectedValue,
                        activeColor: Colors.blue,
                        onChanged: (int? value) {
                          setState(() => selectedValue = value!);
                          BlocProvider.of<UserBloc>(context)
                              .add(AllAgeSortEvent());
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Age: Elder'),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: selectedValue,
                        activeColor: Colors.blue,
                        onChanged: (int? value) {
                          setState(() => selectedValue = value!);
                          context.read<UserBloc>().add(ElderAgeSortEvent());
                        },
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Age: Younger'),
                      leading: Radio<int>(
                        value: 3,
                        groupValue: selectedValue,
                        activeColor: Colors.blue,
                        onChanged: (int? value) {
                          setState(() => selectedValue = value!);
                          context.read<UserBloc>().add(YoungerAgeSortEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Future<dynamic> addUserImage(
      BuildContext context,
      Size size,
      TextEditingController nameController,
      TextEditingController ageController,
      TextEditingController phoneController) {
    File? profileImage;

    GlobalKey<FormState> userKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Form(
                  key: userKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add A New User',
                            style: AppFonts.montesserateHeading),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade200,
                                      Colors.blue.shade700
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: profileImage == null
                                    ? const Icon(Icons.person,
                                        size: 70, color: Colors.white)
                                    : ClipOval(
                                        child: Image.file(
                                          profileImage!,
                                          fit: BoxFit.cover,
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              bottom: 0,
                              right: 105,
                              child: GestureDetector(
                                onTap: () async {
                                  final pickedImage = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (pickedImage != null) {
                                    setState(() =>
                                        profileImage = File(pickedImage.path));
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 4),
                                  child: HalfDisc(),
                                ),
                              ),
                            ),
                            Positioned(
                              right: size.width / 2.95,
                              bottom: 0,
                              child: const Icon(Icons.camera_alt_outlined,
                                  color: AppColors.white),
                            )
                          ],
                        ),
                        Text('Name', style: AppFonts.montesserateGrey),
                        const SizedBox(height: 10),
                        MyTextField(
                            validator: (value) =>
                                Validations.isEmpty(value, 'Name'),
                            controller: nameController,
                            hintText: 'Enter Name'),
                        const SizedBox(height: 10),
                        Text('Age', style: AppFonts.montesserateGrey),
                        const SizedBox(height: 10),
                        MyTextField(
                            validator: (value) =>
                                Validations.isNumber(value, 'Age'),
                            controller: ageController,
                            hintText: 'Enter Age'),
                        Text('Phone', style: AppFonts.montesserateGrey),
                        const SizedBox(height: 10),
                        MyTextField(
                            validator: (value) =>
                                Validations.isPhoneNumber(value),
                            controller: phoneController,
                            hintText: 'Enter Phone Number'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel',
                                  style: TextStyle(color: AppColors.black)),
                            ),
                            BlocListener<UserBloc, UserState>(
                              listener: (context, state) {},
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () {
                                  if (userKey.currentState!.validate()) {
                                    if (profileImage == null) {
                                      // ignore: void_checks
                                      return topSnackbar(context,
                                          'Please add your image', Colors.red);
                                    }
                                    final age = int.parse(ageController.text);
                                    final userData = UserModel(
                                        phoneNumber: phoneController.text,
                                        image: profileImage!.path,
                                        name: nameController.text,
                                        age: age);
                                    context.read<UserBloc>().add(
                                        SaveButtonClickedEvent(
                                            userModel: userData));
                                    ageController.text = '';
                                    nameController.text = '';
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text('Save',
                                    style: TextStyle(color: AppColors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

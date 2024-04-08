import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_x/controller/user/user_bloc.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/constants/image_urls.dart';
import 'package:total_x/resources/widgets/appbar.dart';
import 'package:total_x/resources/widgets/search_textfield.dart';
import 'package:total_x/resources/widgets/user_list_builder_widget.dart';
import 'package:total_x/utils/bottom_sheet.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int optionValue = 1;
  String? imagePath;
  File? profileImage;

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                      validator: (value) => null,
                      controller: searchController,
                      hintText: 'Search by name'),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      BottotmSheets.sortBottomSheet(context, optionValue);
                    },
                    child: Image.asset(ImageUrls.menuIcon))
              ],
            ),
            const SizedBox(height: 8),
            Text('User Lists', style: AppFonts.montesserateHeading),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserAddedState) {
                    return UserListBuilderWidget(
                        itemCount: state.usermodel.length,
                        userList: state.usermodel);
                  } else if (state is AllAgeGroupSuccessState) {
                    return UserListBuilderWidget(
                        itemCount: state.userList.length,
                        userList: state.userList);
                  } else if (state is ElderAgeGroupSuccessState) {
                    return UserListBuilderWidget(
                        itemCount: state.userList.length,
                        userList: state.userList);
                  } else if (state is YoungerAgeGroupSuccessState) {
                    return UserListBuilderWidget(
                        itemCount: state.userList.length,
                        userList: state.userList);
                  }
                  return Center(
                    child: Text(
                      'No Data Found',
                      style: AppFonts.montesserateGrey,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: AppColors.white),
        onPressed: () {
          BottotmSheets.addUserImage(
              context, size, nameController, ageController, phoneController);
        },
      ),
    );
  }
}

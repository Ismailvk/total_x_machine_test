import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/add_user_circleavatar_widget.dart';
import 'package:total_x/resources/widgets/search_textfield.dart';
import 'package:total_x/resources/widgets/textfield.dart';
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
  ValueNotifier<int> optionValueNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.location_on, color: AppColors.white),
            SizedBox(width: 5),
            Text(
              'Nilambur',
              style: TextStyle(color: AppColors.white, fontSize: 18),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                      validator: (value) {},
                      controller: searchController,
                      hintText: 'Search by name'),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      BottotmSheets.sortBottomSheet(
                          context, optionValueNotifier);
                    },
                    child: Image.asset('lib/images/Vector.png'))
              ],
            ),
            const SizedBox(height: 8),
            Text('User Lists', style: AppFonts.montesserateHeading),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/06/78/09/78/360_F_678097876_9kJnFlRYGAeibsVxspqtCL9UR8giLAvF.jpg'),
                      ),
                      title: Text('Martin Dokidis'),
                      subtitle: Text('34'),
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String? imagePath;
              File? profileImage;
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add A New User',
                          style: AppFonts.montesserateHeading),
                      const SizedBox(height: 10),
                      Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
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
                              child: const Icon(
                                Icons.person,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 10,
                          bottom: 0,
                          right: 105,
                          child: GestureDetector(
                              onTap: () async {
                                final pickedimage = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedimage != null) {
                                  File imagePicked = File(pickedimage.path);
                                  imagePath = imagePicked.path;
                                  setState(() {});
                                }
                              },
                              child: const HalfDisc()),
                        ),
                        Positioned(
                          right: size.width / 3,
                          bottom: 0,
                          child: const Icon(Icons.camera_alt_outlined,
                              color: AppColors.white),
                        )
                      ]),
                      Text('Name', style: AppFonts.montesserateGrey),
                      const SizedBox(height: 10),
                      MyTextField(
                          validator: (value) {},
                          controller: nameController,
                          hintText: 'Enter Name'),
                      const SizedBox(height: 10),
                      Text('Age', style: AppFonts.montesserateGrey),
                      const SizedBox(height: 10),
                      MyTextField(
                          validator: (value) {},
                          controller: ageController,
                          hintText: 'Enter Age'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle cancel action
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

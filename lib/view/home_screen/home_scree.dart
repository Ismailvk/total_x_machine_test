import 'dart:io';
import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/resources/widgets/search_textfield.dart';
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
  int optionValue = 1;
  String? imagePath;
  File? profileImage;

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
                      validator: (value) => null,
                      controller: searchController,
                      hintText: 'Search by name'),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                    onTap: () {
                      BottotmSheets.sortBottomSheet(context, optionValue);
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
          BottotmSheets.addUserImage(
              context, size, nameController, ageController);
        },
      ),
    );
  }
}

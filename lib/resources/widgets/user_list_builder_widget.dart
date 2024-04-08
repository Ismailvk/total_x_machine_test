import 'dart:io';

import 'package:flutter/material.dart';
import 'package:total_x/model/user_model.dart';
import 'package:total_x/resources/constants/font_style.dart';
import 'package:total_x/utils/show_dialogue.dart';

class UserListBuilderWidget extends StatelessWidget {
  final int itemCount;
  final List<UserModel> userList;
  const UserListBuilderWidget(
      {super.key, required this.itemCount, required this.userList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = userList[index];
        return GestureDetector(
          onTap: () {
            ShowDialogue.detailsCard(context, user);
          },
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                  radius: 40, backgroundImage: FileImage(File(user.image))),
              title: Text("Name: ${user.name}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age: ${user.age.toString()}",
                      style: AppFonts.montesserateGrey),
                  Text("Age: ${user.phoneNumber}",
                      style: AppFonts.montesserateGrey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

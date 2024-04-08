import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/utils/show_dialogue.dart';

PreferredSizeWidget appbar(BuildContext context) {
  return AppBar(
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
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
            onTap: () async {
              ShowDialogue.dialogue(context, AppColors.red, "LogOut",
                  'Do you want Logout', () => null);
            },
            child: const Icon(Icons.logout)),
      )
    ],
  );
}

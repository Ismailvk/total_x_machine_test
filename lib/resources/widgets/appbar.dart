import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/app_colors.dart';

PreferredSizeWidget appbar() {
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
              await FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout)),
      )
    ],
  );
}

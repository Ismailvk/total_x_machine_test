import 'package:flutter/material.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/view/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.black),
        appBarTheme: const AppBarTheme(color: AppColors.black),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

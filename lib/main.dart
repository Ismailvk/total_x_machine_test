import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_x/controller/login/login_bloc.dart';
import 'package:total_x/controller/user/user_bloc.dart';
import 'package:total_x/resources/constants/app_colors.dart';
import 'package:total_x/view/wrapper/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCOCfa-egpE2BvEnLxrBA-jTymQWX4leJM",
            appId: "1:507603239131:android:40c06cc63aab4c41708cfe",
            messagingSenderId: "507603239131",
            projectId: "totalx-46b25",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColors.black),
          appBarTheme: const AppBarTheme(color: AppColors.black),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

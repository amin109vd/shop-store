import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoppstore/features/login_feature/presentation/screen/login_page.dart';

import 'core/presentation/screen/root_screen.dart';
import 'features/profile_feature/presentation/screen/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    );
  }
}

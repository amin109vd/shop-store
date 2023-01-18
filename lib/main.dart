import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/presentation/screen/root_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: RootScreen(),
    );
  }
}
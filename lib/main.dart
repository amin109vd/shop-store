import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/theme_data/theme/theme_binding.dart';
import 'config/theme_data/theme/theme_logic.dart';
import 'core/presentation/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: RootScreen(),
      initialBinding: ThemeBinding(),
    );
  }
}

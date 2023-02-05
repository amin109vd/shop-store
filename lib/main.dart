import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppstore/config/color.dart';
import 'core/presentation/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    bool _iconBool = false;
    IconData _iconLight = Icons.wb_sunny;
    IconData _iconDark = Icons.nights_stay;

    ThemeData _lightTheme = ThemeData(
        primarySwatch: Colors.cyan, brightness: Brightness.light);

    ThemeData _darkTheme = ThemeData(
      primarySwatch: Colors.red, brightness: Brightness.dark,
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xff00ADB5)));
    return GetMaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme, home: RootScreen(),);
  }
}

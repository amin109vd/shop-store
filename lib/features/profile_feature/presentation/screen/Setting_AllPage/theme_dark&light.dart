import 'package:flutter/material.dart';

class Theme_DarkLight extends StatefulWidget {
  const Theme_DarkLight({Key? key}) : super(key: key);

  @override
  State<Theme_DarkLight> createState() => _Theme_DarkLightState();
}

class _Theme_DarkLightState extends State<Theme_DarkLight> {
  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light);
  ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Change Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

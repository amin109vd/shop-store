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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xff00ADB5),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff00ADB5),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  setState(() {
                    _iconBool = !_iconBool;
                  });
                },
                child: Text(
                  'Change Theme',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

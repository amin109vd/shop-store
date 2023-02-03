import 'package:flutter/material.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/Setting_AllPage/change_password.dart';

class CurrectPassword extends StatefulWidget {
  const CurrectPassword({Key? key}) : super(key: key);

  @override
  State<CurrectPassword> createState() => _CurrectPasswordState();
}

class _CurrectPasswordState extends State<CurrectPassword> {
  bool showpassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Change PIN'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [buildTextfield("Enter your current PIN", "Der Aa123456", false),ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff00ADB5),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(),));

              },
              child: Text(
                'Enter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.black),
              ))
          ],
        ),
      ),
    );
  } Widget buildTextfield(
      String labelText, String placeholder, bool isPasswordTextfield) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.0),
      child: TextField(
          obscureText: isPasswordTextfield ? showpassword : false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              hintText: placeholder,
              suffixIcon: isPasswordTextfield
                  ? IconButton(
                  onPressed: () {
                    setState(() {
                      showpassword = !showpassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ))
                  : null,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: labelText,
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
    );
  }
}

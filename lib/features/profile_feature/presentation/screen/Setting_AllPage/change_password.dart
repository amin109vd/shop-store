import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/home_screen.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/setting.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showpassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xff00ADB5),
          onPressed: () {
    Navigator.pop(context);
    Navigator.pop(context);
          }      ),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
          child: Column(
            children: [
              buildTextfield("Enter New Password", "DER Aa123456", true),
              buildTextfield("Repetition New Password", "DER Aa123456", true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff00ADB5),
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {

                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextfield(
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

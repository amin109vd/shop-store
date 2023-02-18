import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppstore/core/utils/extention.dart';
import 'package:shoppstore/features/profile_feature/presentation/screen/setting.dart';
import 'package:image_picker/image_picker.dart';

import 'home_screen.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {


  void takePhoto(source) async {
    final p = await _picker.getImage(source: source,);
    setState(() {
      imagefile = p;
    });
  }



  bool showpassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xff00ADB5),
          onPressed: () {
            Navigator.pop(context,imagefile);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                  Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10),
                      ),
                    ],
                    image: imagefile==null ? DecorationImage(
                      image: AssetImage('assets/image/human-face-icon-29.jpg')

                    ): DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imagefile!.path))

                    )
                  ),
                ),

                  Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(context: context,
                              builder: (context) => bottomSheet(context),);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff00ADB5),
                                border: Border.all(
                                    width: 4,
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextfield("full name", "Der alex", false),
              buildTextfield("e_mail", "Alex.88@gmail.com", false),
              buildTextfield("password", "********", true),
              buildTextfield("locaion", "Karaj,Iran", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pop(context,imagefile);
                    },
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
                        Get.snackbar("setting", "Saved chenges");
                        image=imagefile;
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
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildTextfield(String labelText, String placeholder,
      bool isPasswordTextfield) {
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

  Widget bottomSheet(context) {
    return Container(
      height: height(context) / 8,
      color: Colors.white,
      child: Column(
        children: [
          10.toHeight,
          Text("choose profile photo"),
          20.toHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Row(
                  children: [Icon(Icons.image), Text("Gallery")],
                ),
              ),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Row(
                  children: [Icon(Icons.camera), Text("Camera")],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
PickedFile? imagefile;
final ImagePicker _picker = ImagePicker();
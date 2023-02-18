import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyThemeController extends GetxController {
  var a = false.obs;
  void changeTheme() {
   if(a.value){
     Get.changeTheme(ThemeData.light());
     a.value=!a.value;
   }else{
     Get.changeTheme(ThemeData.dark());
     a.value=!a.value;
   }
  }
}

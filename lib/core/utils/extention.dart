import 'package:flutter/cupertino.dart';

extension Sizee on num{
  SizedBox get toHeight => SizedBox(height: toDouble(),);
  SizedBox get toWidth => SizedBox(width: toDouble(),);
}
height(context){return MediaQuery.of(context).size.height;}
width(context){return MediaQuery.of(context).size.width;}
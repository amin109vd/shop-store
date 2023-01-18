import 'package:flutter/cupertino.dart';

extension Size on num{
  SizedBox get toHeight => SizedBox(height: toDouble(),);
  SizedBox get toWidth => SizedBox(width: toDouble(),);
}
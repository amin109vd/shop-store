import 'package:flutter/cupertino.dart';

extension Sizee on num{
  SizedBox get toHeight => SizedBox(height: toDouble(),);
  SizedBox get toWidth => SizedBox(width: toDouble(),);
}
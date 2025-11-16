import 'package:flutter/material.dart';

abstract class AppColors {
  static const white = Color(0xffFFFFFF);
  static const redButton = Color(0xffC01B02);
  static const MaterialColor pink = MaterialColor(0xffF191AC, <int, Color>{
    1: Color(0xffF4BBC9),
    2: Color(0xffFAE6E7),
    3: Color(0xffFBEDEE),
    4: Color(0xffF7EEED),
  });
  static const MaterialColor black = MaterialColor(0xff000000, <int, Color>{
    1: Color(0xff1E1E1E),
    2: Color(0xff282B35),
  });
  static const MaterialColor grey = MaterialColor(0xff4A5759, <int, Color>{
    1: Color(0xff656161),
    2: Color(0xffD9D9D9),
  });
}

import 'package:flutter/material.dart';

//! extension to add space using sizedBox
//* using : 16.height or 16.width
extension SizeExtensions on num {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(height: toDouble());
}

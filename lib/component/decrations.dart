import 'package:flutter/material.dart';
import 'package:tec/constant/my_colors.dart';

class MyDecoration {
  MyDecoration._();
  static BoxDecoration mainGradiant = BoxDecoration(
    gradient: LinearGradient(colors: GradiantColors.bottomNav),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
}

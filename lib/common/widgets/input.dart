import 'package:flutter/material.dart';

import '../utils/screen.dart';
import '../values/colors.dart';
import '../values/values.dart';

Widget inputTextEdit(
    {@required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String hintText,
    bool isPassword = false,
    double marginTop = 15}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none),
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(18)),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}

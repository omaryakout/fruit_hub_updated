import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.keyBoardType,
      this.suffixIcon,
      this.label,
      this.onSaved,
      this.obsecureText = false});
  TextInputType keyBoardType;
  Widget? suffixIcon;
  Widget? label;
  void Function(String? input)? onSaved;
  bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        obscureText: obsecureText,
        keyboardType: keyBoardType,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please fill input';
          }
          return null;
        },
        decoration: InputDecoration(
            
            fillColor: Color(0xFFF9FAFA),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
            suffixIcon: suffixIcon,
            label: label),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(width: 1));
  }
}

import 'package:flutter/material.dart';
import '../../core/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLoginButton extends StatelessWidget {
  CustomLoginButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.function});
  VoidCallback function;
  String text;
  String icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            
            side: BorderSide(color: Color.fromARGB(255, 230, 197, 197), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: function,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyle.semiBold16.copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        ));
  }
}

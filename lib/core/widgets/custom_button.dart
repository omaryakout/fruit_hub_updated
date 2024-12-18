import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onPressed,required this.text
  });
  final VoidCallback onPressed;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(onPressed: onPressed, child: text,
      style: TextButton.styleFrom(
        backgroundColor: AppColor.primaryColors,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      ),
    );
  }
}

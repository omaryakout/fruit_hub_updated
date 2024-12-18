import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({super.key, required this.isChecked, required this.passData});
  bool isChecked;
  void Function(bool val) passData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isChecked = !isChecked;
          passData(isChecked);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 24,
          width: 24,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                  color: isChecked ? Colors.transparent : Color(0xffDDDFDF)),
            ),
            color: isChecked ? Color(0xff1B5E37) : Colors.white,
          ),
          child: isChecked
              ? Padding(
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(Assets.imagesCheck),
                )
              : const SizedBox(),
        ));
  }
}

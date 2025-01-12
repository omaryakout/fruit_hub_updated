import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  InactiveStepItem({super.key, required this.int, required this.text});
  final num int;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Color(0XFFF2F3F3),
            child: Text(
              int.toString(),
              style: AppTextStyle.semiBold13.copyWith(color: Colors.black),
            )),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppTextStyle.bold13.copyWith(color: Color(0XFFAAAAAA)),
        )
      ],
    );
  }
}

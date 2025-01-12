import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Color(0XFF1B5E37),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
          radius: 11.5,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppTextStyle.bold13.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}

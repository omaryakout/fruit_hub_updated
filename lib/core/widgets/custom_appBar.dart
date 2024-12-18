import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar({context, required String title, required Icon icon, required void Function() function}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.bold16,
    ),
    leading: GestureDetector(
      child: icon,
      onTap: function,
    ),
  );
}

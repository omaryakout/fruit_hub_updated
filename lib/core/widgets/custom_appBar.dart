import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(
    {context,
    required String title,
    Icon? icon,
    void Function()? function,
    required bool showNotificationButton}) {
  ;
  return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.bold16,
      ),
      leading: showNotificationButton == true
          ? GestureDetector(
              child: icon,
              onTap: function,
            )
          : null);
}

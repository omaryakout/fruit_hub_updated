import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class custom_notification_item extends StatelessWidget {
  const custom_notification_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.imagesNotification);
  }
}

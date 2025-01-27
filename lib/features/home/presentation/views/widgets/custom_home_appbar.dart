import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_notification_item.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesAvatar),
      title: Text('صباح الخير',
          style: AppTextStyle.regular16.copyWith(color: Color(0xFF9E9D94))),
      subtitle: Text(getUser().name,
          style: AppTextStyle.bold16
              .copyWith(color: Color.fromARGB(255, 20, 20, 20))),
      trailing: Container(
        width: 34,
        height: 34,
        decoration: const ShapeDecoration(shape: OvalBorder()),
        child: custom_notification_item(),
      ),
    );
  }
}

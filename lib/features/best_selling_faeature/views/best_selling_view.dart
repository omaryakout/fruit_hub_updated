import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_notification_item.dart';
import 'package:fruits_hub/features/best_selling_faeature/views/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best selling view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          'الأكثر مبيعًا',
          style: AppTextStyle.bold19.copyWith(color: Colors.black),
        )),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: custom_notification_item(),
          )
        ],
      ),
      body: BestSellingViewBody(),
    );
  }
}

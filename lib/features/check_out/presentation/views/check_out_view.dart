import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appBar.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const routeName = 'CheckOutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الشحن',
        showNotificationButton: false,
      ),
      body: CheckOutViewBody(),
    );
  }
}

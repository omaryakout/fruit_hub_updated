import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../home/domain/entities/cart_item_entity.dart';
import '../../../home/domain/entities/overall_cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key, required this.overallCartEntity});
  static const routeName = 'CheckOutView';
  OverallCartEntity overallCartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الشحن',
        showNotificationButton: false,
      ),
      body: Provider.value(
        value: OrderEntity(overallCartEntity),
        child: CheckOutViewBody()),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../home/domain/entities/cart_item_entity.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key, required this.cartItems});
  static const routeName = 'CheckOutView';
  List<CartItemEntity> cartItems;
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

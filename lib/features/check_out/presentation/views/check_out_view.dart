import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/get_user.dart';
import 'package:fruits_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/address_input_section.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_appBar.dart';
import '../../../home/domain/entities/cart_item_entity.dart';
import '../../../home/domain/entities/overall_cart_entity.dart';
import '../../domain/entities/order_entity.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatefulWidget {
  CheckOutView({super.key, required this.overallCartEntity});
  static const routeName = 'CheckOutView';
  OverallCartEntity overallCartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(place: 'efo',shippingAddressEntity: ShippingAddressEntity(),widget.overallCartEntity,
    uid: getUser().uid
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'الشحن',
        showNotificationButton: false,
      ),
      body: Provider.value(
          value: orderEntity,
          child: CheckOutViewBody()),
    );
  }
}

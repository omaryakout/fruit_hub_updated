import 'dart:developer';

import 'package:fruits_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import '../../../home/domain/entities/overall_cart_entity.dart';

class OrderEntity {
  final OverallCartEntity overallCartEntity;
  final ShippingAddressEntity shippingAddressEntity;
  final String uid;
  bool? payWithCash;

  OrderEntity(
    this.overallCartEntity, {
    required this.shippingAddressEntity,
    required String place,
    required this.uid,
    this.payWithCash,
  }) {
    log('init order entity $place');
  }

  double calcShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return overallCartEntity.calculateTotalPrice()+calcShippingCost() -
        calculateShippingDiscount();
  }

  
}

import 'package:fruits_hub/features/check_out/data/models/order_product_model.dart';
import 'package:fruits_hub/features/check_out/data/models/shipping_address_model.dart';

import '../../domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
      required this.uid,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromOrderProductModel(OrderEntity orderEntity) {
    return OrderModel(
        totalPrice:
            orderEntity.overallCartEntity.calculateTotalPrice().toDouble(),
        uid: orderEntity.uid,
        shippingAddressModel: ShippingAddressModel.fromShippingAddressEntity(
            orderEntity.shippingAddressEntity),
        orderProducts: orderEntity.overallCartEntity.items.map(
          (e) {
            return OrderProductModel.fromCartItemEntity(cartItem: e);
          },
        ).toList(),
        paymentMethod: orderEntity.payWithCash! ? 'cash' : 'online');
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uid': uid,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts
          .map(
            (e) => e.toJson(),
          )
          .toList(),
      'paymentMethod': paymentMethod,
    };
  }
}

import 'package:fruits_hub/features/check_out/domain/entities/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromEntity(OrderEntity orderEntity) => Details(
        subtotal: orderEntity.overallCartEntity.calculateTotalPrice().toString(),
        shipping: orderEntity.calcShippingCost().toString(),
        shippingDiscount:orderEntity.calculateShippingDiscount().toInt(),
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
}

import 'package:fruits_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import '../../../home/domain/entities/overall_cart_entity.dart';

class OrderEntity {
  final OverallCartEntity overallCartEntity;
  final ShippingAddressEntity? shippingAddressEntity;
  bool? payWithCash;
  

  OrderEntity(
     this.overallCartEntity,
    { this.shippingAddressEntity,
    this.payWithCash,}
 );
}

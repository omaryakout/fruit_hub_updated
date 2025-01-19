import 'package:fruits_hub/features/check_out/domain/entities/shipping_address_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> orderItems;
  final ShippingAddressEntity shippingAddressEntity;
  final bool payWithCash;
  

  OrderEntity(
     this.orderItems,
     this.shippingAddressEntity,
    this.payWithCash,
 );
}

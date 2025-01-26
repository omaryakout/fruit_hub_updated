import '../../../home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromCartItemEntity({required CartItemEntity cartItem}) {
    return OrderProductModel(
        name: cartItem.productEntity.name,
        code: cartItem.productEntity.code,
        imageUrl: cartItem.productEntity.imageUrl,
        price: cartItem.productEntity.price.toDouble(),
        quantity: cartItem.count);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}

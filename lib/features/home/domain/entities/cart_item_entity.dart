import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';

class CartItemEntity {
  CartItemEntity({required this.productEntity, this.count = 0});
  final ProductEntity productEntity;
  int count;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalweight() {
    return productEntity.unitAmount * count;
    
  }
}

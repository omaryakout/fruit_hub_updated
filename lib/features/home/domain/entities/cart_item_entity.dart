import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  CartItemEntity({required this.productEntity, this.count = 0});
  final ProductEntity productEntity;
  int count;

  ProductEntity getProduct(ProductEntity productEntity) {
    return productEntity;
  }

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
    return productEntity.ratingCount * count;
  }

  @override
  List<Object?> get props => [productEntity];
}

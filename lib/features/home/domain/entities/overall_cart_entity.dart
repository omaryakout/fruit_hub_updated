import 'package:fruits_hub/features/auth/domain/entity/product_entity.dart';

import 'cart_item_entity.dart';

class OverallCartEntity {
  final List<CartItemEntity> items;
  OverallCartEntity(this.items);

  bool isProductExsist(ProductEntity productEntity) {
    for (var item in items) {
      if (item.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  num calculateTotalPrice() {
    double price = 0;
    for (var item in items) {
      
      price = price + item.calculateTotalPrice();
      
    }
    return price;
  }

  void addNewProduct(CartItemEntity cartItem) {
    items.add(cartItem);
  }

  void removeProduct(CartItemEntity cartItem) {
    items.remove(cartItem);
  }
}

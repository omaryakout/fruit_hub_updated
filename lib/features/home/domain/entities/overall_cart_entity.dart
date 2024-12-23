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

  void addNewProduct(CartItemEntity cartItem) {
    items.add(cartItem);
  }

  void removeProduct(CartItemEntity cartItem) {
    items.remove(cartItem);
  }

  CartItemEntity getCartItemEntity(ProductEntity productEntityFromUser) {
    for (var item in items) {
      if (productEntityFromUser == item.productEntity) {
        return item;
      } 
     
      
    } return  CartItemEntity(productEntity: productEntityFromUser, count: 1);
  }
}

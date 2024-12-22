import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../auth/domain/entity/product_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/overall_cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  OverallCartEntity overallCartEntity = OverallCartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExsist = overallCartEntity.isProductExsist(productEntity);
    if (isProductExsist) {
    } else {
      CartItemEntity cartItemEntity =
          CartItemEntity(productEntity: productEntity, count: 1);
      overallCartEntity.items.add(cartItemEntity);
    }
    emit(CartAdd());
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

   

  void update
    (CartItemEntity cartItemEntity) {
    
    emit(CartItemUpdated( cartItemEntity));
  }
}

import 'package:fruits_hub/core/helper_functions/get_currency.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/domain/entities/overall_cart_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity entity) => Item(
        name:entity.productEntity.name ,
        quantity:entity.count ,
        price:entity.calculateTotalPrice().toString() ,
        currency:getCurrency() ,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}

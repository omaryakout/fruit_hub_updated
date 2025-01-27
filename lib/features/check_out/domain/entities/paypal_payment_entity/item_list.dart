import 'package:fruits_hub/features/home/domain/entities/overall_cart_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(OverallCartEntity entity) => ItemList(
        items: entity.items.map((e) =>Item.fromEntity(e),).toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}

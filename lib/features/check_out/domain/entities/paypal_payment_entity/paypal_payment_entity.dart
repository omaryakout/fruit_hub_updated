import 'package:fruits_hub/features/check_out/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';


class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({
    this.amount,
    this.description,
    this.itemList,
  });

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount:Amount.fromEntity(entity) ,
      description:'Payment description' ,
      itemList:ItemList.fromEntity(entity.overallCartEntity) ,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}

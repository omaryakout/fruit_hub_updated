import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/fruit_item.dart';

import '../../../../auth/data/model/products_model.dart';
import '../../../../auth/domain/entity/product_entity.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key,required this.products});
  List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8),
      delegate: SliverChildBuilderDelegate(
        childCount: products.length,
        (context, index) => FruitItem(productEntity: products[index],)),
    );
  }
}

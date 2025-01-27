import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';

class ListFeatured extends StatelessWidget {
  ListFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(3, (index) {
        return FeaturedItem();
      }, growable: false)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_divider_products.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_appBar.dart';
import '../../../../../core/widgets/custom_notification_item.dart';
import '../../../../../core/widgets/custom_search_bar.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          function: () {},
          icon: Icon(Icons.notifications),
          title: 'المنتجات',
          context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomSearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomDividerProducts(),
          ),
        ],
      ),
    );
  }
}

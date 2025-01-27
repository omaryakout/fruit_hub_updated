import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/get_dummy_products.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubits/product_cubit/products_cubit.dart';
import 'error_bar.dart';

class CustomGridViewBlocBuilder extends StatelessWidget {
  const CustomGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailure) {
          return ErrorBar(
            text: state.errMessage,
          );
        } else if (state is ProductsSucess) {
          return CustomGridView(
            products: state.products,
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: CustomGridView(products: GetDummyProducts().getDummyList()),
          );
        }
      },
    );
  }
}

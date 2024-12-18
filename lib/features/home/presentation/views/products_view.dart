import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_view_body.dart';

import '../../../../core/services/get_it.dart';
import '../../../auth/domain/repos/product_repo.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
      child: ProductsViewBody(),
    );
  }
}

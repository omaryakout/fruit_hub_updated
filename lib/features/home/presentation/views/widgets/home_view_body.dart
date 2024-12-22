import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_hub/features/best_selling_faeature/views/best_selling_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/grid_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/list_featured.dart';

import '../../../../../core/widgets/custom_search_bar.dart';
import 'custom_grid_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  CustomHomeAppbar(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: SizedBox(
                        height: 40, child: Center(child: CustomSearchBar())),
                  ),
                  ListFeatured(),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    child: BestSellingHeader(),
                    onTap: () {
                      Navigator.pushNamed(context, BestSellingView.routeName);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            CustomGridViewBlocBuilder(
              
            ),
          ],
        ),
      ),
    );
  }
}



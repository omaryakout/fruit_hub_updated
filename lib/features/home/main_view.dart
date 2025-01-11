import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_hub/core/services/get_it.dart';
import 'package:fruits_hub/features/auth/domain/repos/product_repo.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/main_view_body_bloc_consumer.dart';

import 'presentation/views/widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'HomeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(getIt<ProductRepo>()),
        ),
        BlocProvider(
          create: (context) => CartItemCubit(),
        ),
        
      ], child:  SafeArea(
        child: Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              onTappedItem: (value) {
                currentViewIndex = value;
                setState(() {});
              },
            ),
            body: MainViewBodyBlocConsumer(
              index: currentViewIndex,
            ))));
  }

      
}

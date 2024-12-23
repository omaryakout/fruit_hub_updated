import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cart_cubit/cart_cubit.dart';

import '../cart_view.dart';
import '../home_view.dart';
import '../products_view.dart';

class MainViewBody extends StatefulWidget {
  MainViewBody({super.key, required this.index});
  int index;
  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  Widget returnBodyPage(int bodyIndex) {
    if (bodyIndex == 0) {
      return const HomeView();
    } else {
      return ProductsView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: IndexedStack(
        index: widget.index,
        children: [
          HomeView(),
          ProductsView(),
          CartView(),
        ],
      ),
    );
  }
}




// IndexedStack(
//       index:widget. index,
//       children: [
//         HomeView(),
             
//              ProductsView(),
//       ],
//     ) ;
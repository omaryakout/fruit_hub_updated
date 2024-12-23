import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';

import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartItemCubit>(
          create: (context) => CartItemCubit(),
        ),
         BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      
      child: CartViewBody(),
    );
  }
}

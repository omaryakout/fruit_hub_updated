import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_divider_products.dart';

import '../../../domain/entities/overall_cart_entity.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if(state is CartAdd){
          
        }
      },
      builder: (context, state) {
        return SliverList.separated(
            separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: context.read<CartCubit>().overallCartEntity.items.length,
          itemBuilder: (context, index) {
            return CartItem(cartItemEntity:context.read<CartCubit>().overallCartEntity.items[index] );
          },
        
        );
      },
    );
  }
}

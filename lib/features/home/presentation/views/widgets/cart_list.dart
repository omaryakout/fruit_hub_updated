import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_divider_products.dart';

import '../../../domain/entities/cart_item_entity.dart';

class CartList extends StatelessWidget {
   CartList({super.key});
List<CartItemEntity>items = [];
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(listeners: [
      BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAdd) {
            
          }
          
        },
      ),
      BlocListener<CartItemCubit, CartItemState>(
        listener: (context, state) {
          if (state is  CartItemUpdated) {
            
          
          }
          
        },
      )
    ], child:  BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    CartItem(cartItemEntity: items[index]),
                    CustomDividerProducts(),
                  ],
                );
              },
              childCount: items.length,
            ),
          );
        },
      ),
    );
  }
}
// return BlocConsumer<CartCubit, CartState>(
//       listener: (context, state) {
//        if(state is CartAdd){
       
//        }
//       },
//       builder: (context, state) {
//         return SliverList.separated(
//           itemCount:context.read<CartCubit>().overallCartEntity.items.length ,
         
//           separatorBuilder: (context, index) {
//             return const SizedBox(
//               height: 10,
//             );
//           },
//            itemBuilder: (context, index) {
//             return CartItem(cartItemEntity: context.read<CartCubit>().overallCartEntity.items[index],);
//           },
//         );
//       },
//     );
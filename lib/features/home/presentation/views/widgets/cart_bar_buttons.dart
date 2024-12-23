import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/domain/entity/product_entity.dart';
import '../../../domain/entities/cart_item_entity.dart';

class CartBarButton extends StatefulWidget {
   CartBarButton({super.key , required this.cartItemEntity});
  CartItemEntity cartItemEntity;
  @override
  State<CartBarButton> createState() => _CartBarButtonState();
}

class _CartBarButtonState extends State<CartBarButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CartItemActionButton(
          color: AppColors.lightPrimaryColor,
          icon: Icons.add,
          iconColor: Colors.white,
          onPressed: () {
          
                
                widget.cartItemEntity
                .increment();
                context.read<CartItemCubit>().update( widget.cartItemEntity);
                setState(() {
                  
                });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          '${widget.cartItemEntity.count}',
          style: AppTextStyle.bold16,
        ),
        const SizedBox(
          width: 16,
        ),
        CartItemActionButton(
          color: Color(0XFFF3F5F7),
          icon: Icons.remove,
          iconColor: Color(0XFF979899),
          onPressed: () {
             widget.cartItemEntity
                .decrement();
                context.read<CartItemCubit>().update( widget.cartItemEntity);
                setState(() {
                  
                });
          },
        ),
      ],
    );
  }
}

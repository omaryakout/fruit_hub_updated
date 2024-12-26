import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_bar_buttons.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartItemCubit, CartItemState>(
      listener: (context, state) {
        if (state is CartItemUpdated) {
          
         
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 95,
          child: Row(
            children: [
              Container(
                height: 95,
                width: 73,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: Image.network(widget.cartItemEntity.productEntity
                    .imageUrl), // Replace with Image.asset() or similar
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.cartItemEntity.productEntity.name}',
                          style:
                              AppTextStyle.bold13.copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: GestureDetector(
                              child: Image.asset(Assets.imagesTrash),
                              onTap: () {
                                // Add functionality here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.cartItemEntity.calculateTotalweight()} كج',
                      style: AppTextStyle.regular13.copyWith(
                        color: Color(0XFFF4A91F),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CartBarButton(
                          cartItemEntity: widget.cartItemEntity,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            '${widget.cartItemEntity.calculateTotalPrice()} جنيه',
                            style: AppTextStyle.bold16
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit.dart';

class PayButtonBlocConsumer extends StatelessWidget {
  const PayButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(onPressed:() {
         
       } ,text: Text('ادفع ${context.watch<CartCubit>().overallCartEntity.calculateTotalPrice()}'),);
      },
    );
  }
}
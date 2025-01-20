import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/home/domain/entities/overall_cart_entity.dart';
import 'package:fruits_hub/features/home/presentation/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../check_out/presentation/views/check_out_view.dart';
import '../../../../check_out/presentation/views/widgets/check_out_view_body.dart';

class PayButtonBlocConsumer extends StatelessWidget {
  const PayButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              CheckOutView.routeName,
              arguments: context.read<CartCubit>().overallCartEntity.items,
            );
          },
          text: Text(
              'ادفع ${context.watch<CartCubit>().overallCartEntity.calculateTotalPrice()}'),
        );
      },
    );
  }
}

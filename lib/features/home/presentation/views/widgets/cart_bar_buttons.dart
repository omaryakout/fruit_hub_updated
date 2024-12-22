import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CartBarButton extends StatefulWidget {
  const CartBarButton({super.key});

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
          onPressed: () {},
        ),
        const SizedBox(
          width: 16,
        ),
        Text('3',style: AppTextStyle.bold16,),
         const SizedBox(
          width: 16,
        ),
        CartItemActionButton(
          color: Color(0XFFF3F5F7),
          icon: Icons.remove,
          iconColor: Color(0XFF979899),
          onPressed: () {},
        ),
      ],
    );
  }
}

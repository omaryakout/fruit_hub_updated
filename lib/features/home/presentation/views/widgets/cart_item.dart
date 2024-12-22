import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_bar_buttons.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 95,
      
      child: Row(
        children: [
        
          Container(
            height: 95,
            width: 73,
            decoration:const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: Image.network('https://as2.ftcdn.net/v2/jpg/00/78/09/77/1000_F_78097722_DS0SKdmNCZLfefL1CP63kSbMzjjjv9Xy.jpg'), // Replace with Image.asset() or similar
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
                      'بطيخ',
                      style: AppTextStyle.bold13.copyWith(color: Colors.black),
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
                  '3 كج',
                  style: AppTextStyle.regular13.copyWith(
                    color: Color(0XFFF4A91F), 
                  ),
                ),
                const SizedBox(height: 8), 
               Row(
                 children: [
                   CartBarButton(),
                   Spacer(),
                   Padding(
                     padding: const EdgeInsets.only(left: 16),
                     child: Text('60 kg',style:AppTextStyle.bold16.copyWith(color: AppColors.secondaryColor) ,),
                   )
                 ],
               ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



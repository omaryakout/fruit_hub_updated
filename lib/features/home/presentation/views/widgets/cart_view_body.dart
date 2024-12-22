import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_appbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_list.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_button.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'cart_header.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 16)),
                cartAppBar(
                    function: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                    title: 'السلة',
                    context: context),
                CartHeader(),
              ],
            ),
          ),
          CartList(),
        ],
      ),
     Positioned(
      bottom: MediaQuery.sizeOf(context).height*0.07,
      left: 16,
      right: 16,
       child: CustomButton(onPressed:() {
         
       } ,text: Text('ادفع 120'),),
     ),
      ] 
    );
  }
}

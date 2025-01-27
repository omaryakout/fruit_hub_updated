import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';

import '../../features/auth/domain/entity/product_entity.dart';
import '../../features/home/presentation/cubit/cart_cubit.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 214,
          width: 168,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(), color: Color(0xFFF7F5F3)),
          child: Stack(
            children: [
              Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.favorite_border_outlined)),
              Positioned(
                  top: 20,
                  left: 16.5,
                  right: 15.5,
                  child: Image.network(
                    productEntity.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: ListTile(
                  title: Text(
                    productEntity.name,
                    style: AppTextStyle.bold13.copyWith(color: Colors.black),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                        text: productEntity.price.toString(),
                        style: AppTextStyle.bold13
                            .copyWith(color: AppColor.secondrycolors),
                        children: [
                          TextSpan(
                              text: '/الكيلو  ',
                              style: AppTextStyle.bold13.copyWith(
                                  color: AppColor.lightsecondrycolors)),
                        ]),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColor.primaryColors,
                    child: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().addProduct(productEntity);
                          print(context
                              .read<CartCubit>()
                              .overallCartEntity
                              .items);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

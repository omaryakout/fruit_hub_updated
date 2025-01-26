import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_divider.dart';
import 'package:fruits_hub/core/widgets/custom_divider_with_text.dart';
import 'package:fruits_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/container_decoration.dart';

class PaymentSection extends StatelessWidget {
   PaymentSection({super.key,required this.pageController});
  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملخص الطلب :',
          style: AppTextStyle.bold13.copyWith(color: Colors.black),
        ),
        Container(
          decoration: ContainerDecoration.containerDecoration,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              PaymentItem(
                textStyle1:
                    AppTextStyle.regular13.copyWith(color: Color(0XFF4E5556)),
                title: 'المجموع الفرعي :',
                subTitle:
                    '${context.read<OrderEntity>().overallCartEntity.calculateTotalPrice()} جنيه',
                textStyle2:
                    AppTextStyle.semiBold16.copyWith(color: Color(0XFF4E5556)),
              ),
              const SizedBox(
                height: 8,
              ),
              PaymentItem(
                textStyle1:
                    AppTextStyle.regular13.copyWith(color: Color(0XFF4E5556)),
                title: 'التوصيل  :',
                subTitle: '30جنية ',
                textStyle2:
                    AppTextStyle.semiBold13.copyWith(color: Color(0XFF4E5556)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomDivider(),
              const SizedBox(
                height: 8,
              ),
              PaymentItem(
                textStyle1: AppTextStyle.bold16
                    .copyWith(color: Color.fromARGB(255, 16, 16, 16)),
                title: 'الكلي  :',
                subTitle:
                    '${context.read<OrderEntity>().overallCartEntity.calculateTotalPrice() + 30} جنيه ',
                textStyle2: AppTextStyle.bold16
                    .copyWith(color: Color.fromARGB(255, 16, 16, 16)),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            decoration: ContainerDecoration.containerDecoration,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'عنوان التوصيل',
                      style: AppTextStyle.bold13,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        pageController.animateToPage(1,
                            duration: Duration(microseconds: 300),
                            curve: Curves.bounceIn);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'تعديل',
                            style: AppTextStyle.regular13,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    '${context.read<OrderEntity>().shippingAddressEntity.toString()}')
              ],
            ))
      ],
    );
  }
}

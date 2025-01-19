import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_divider.dart';
import 'package:fruits_hub/core/widgets/custom_divider_with_text.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/container_decoration.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

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
                textStyle1: AppTextStyle.regular13
                    .copyWith(color: Color(0XFF4E5556)),
                title: 'المجموع الفرعي :',
                subTitle: '150 جنيه',
                textStyle2: AppTextStyle.semiBold16
                    .copyWith(color: Color(0XFF4E5556)),
              ),
                                 const SizedBox(
                height: 8,
              ),
              PaymentItem(
                textStyle1: AppTextStyle.regular13
                    .copyWith(color: Color(0XFF4E5556)),
                title: 'التوصيل  :',
                subTitle: '30جنية ',
                textStyle2: AppTextStyle.semiBold13
                    .copyWith(color: Color(0XFF4E5556)),
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
                subTitle: '180 جنيه ',
                textStyle2:AppTextStyle.bold16
                    .copyWith(color: Color.fromARGB(255, 16, 16, 16)),
              ),
               SizedBox(
                    height: 15,
                  ),
            ],
          ),
        )
      ],
    );
  }
}

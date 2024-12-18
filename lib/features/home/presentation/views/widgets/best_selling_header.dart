import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Text('الأكثر مبيعا',style: AppTextStyle.bold16,),
        Spacer(),
         Text('المزيد',style: AppTextStyle.regular13,),
        
      ],
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/colors.dart';
import '../../../../../core/utils/app_text_styles.dart';


class FeaturedButton extends StatelessWidget {
   FeaturedButton({super.key,required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 112,
      child: TextButton(onPressed: onPressed, child:FittedBox(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Text('تسوق الان',style: AppTextStyle.bold13,),
      )) ,
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 242, 245, 243),
        foregroundColor: Color.fromARGB(255, 34, 33, 33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
      ),
      ),
    );;
  }
}
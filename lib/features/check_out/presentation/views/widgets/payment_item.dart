import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
   PaymentItem({super.key,required this.title,required this.subTitle,required this.textStyle1,required this.textStyle2});
  String title, subTitle;
  TextStyle textStyle1;
  TextStyle textStyle2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style:textStyle1 ,),
        Spacer(),
        Text(subTitle,style:textStyle2 ,),
      ],
    );
  }
}

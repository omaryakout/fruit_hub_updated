import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class CustomDividerProducts extends StatelessWidget {
  CustomDividerProducts({super.key, this.number});
  final int? number;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('$number'),
          Spacer(),
          Container(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(0),)),
                  ),
              child: Image.asset(Assets.imagesArrowSwapHorizontal)),
        ],
      ),
    );
  }
}

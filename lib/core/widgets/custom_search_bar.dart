import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import '../utils/app_images.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
         decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
         child: TextField(
         
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF9FAFA),
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
              prefixIcon:SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesSearchBar))),
              suffixIcon:SizedBox(
                width: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesFilterBar))), 
              label: Text('ابحث عن ...'),labelStyle:AppTextStyle.regular11), 
             ),
       )
    ;
  }

   OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(width: 1));
  }
}
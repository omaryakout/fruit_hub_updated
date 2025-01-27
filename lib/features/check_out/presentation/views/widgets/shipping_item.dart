import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isSelected,
      required this.onCallBack});
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onCallBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCallBack,
      child: AnimatedContainer(
        duration: Duration(microseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primaryColor
                    : const Color(0x33D9D9D9),
              )),
          color: const Color(0x33D9D9D9),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style:
                        AppTextStyle.semiBold13.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    subTitle,
                    style: AppTextStyle.regular13.copyWith(color: Colors.grey),
                  )
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyle.bold13
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  InActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: Color(0xFF949D9E)),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: Color(0xFF1B5E37),
        shape: OvalBorder(
          side: BorderSide(width: 4, color: Colors.white),
        ),
      ),
    );
  }
}

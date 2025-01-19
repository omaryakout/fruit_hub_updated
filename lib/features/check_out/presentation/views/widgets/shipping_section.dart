import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int SelectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40 جنيه',
          onCallBack: () {
            SelectedIndex = 0;
            setState(() {});
          },
          isSelected: SelectedIndex == 0,
        ),
        const SizedBox(
          height: 8,
        ),
        ShippingItem(
          title: 'اشتري الان وادفع لاحقا',
          subTitle: ' يرجي تحديد طريقه الدفع ',
          price: 'مجاني ',
          onCallBack: () {
            SelectedIndex = 1;
            setState(() {
              
            });
           
          },
           isSelected: SelectedIndex == 1,
        ),
      ],
    );
  }
}

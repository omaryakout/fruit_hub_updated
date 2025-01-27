import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/order_entity.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int SelectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (context
                      .read<OrderEntity>()
                      .overallCartEntity
                      .calculateTotalPrice() +
                  20)
              .toString(),
          onCallBack: () {
            SelectedIndex = 0;
            setState(() {
              orderEntity.payWithCash = true;
            });
          },
          isSelected: SelectedIndex == 0,
        ),
        const SizedBox(
          height: 8,
        ),
        ShippingItem(
          title: 'اشتري الان وادفع لاحقا',
          subTitle: ' يرجي تحديد طريقه الدفع ',
          price: context
              .read<OrderEntity>()
              .overallCartEntity
              .calculateTotalPrice()
              .toString(),
          onCallBack: () {
            SelectedIndex = 1;
            setState(() {
              orderEntity.payWithCash = false;
            });
          },
          isSelected: SelectedIndex == 1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

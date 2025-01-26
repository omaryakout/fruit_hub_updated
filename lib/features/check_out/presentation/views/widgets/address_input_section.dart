import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/custom_text_form_Field.dart';
import '../../../domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});
  GlobalKey<FormState> formKey;
  ValueListenable<AutovalidateMode> valueListenable;
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) {
          return Form(
            
            key: formKey,
            autovalidateMode: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  onSaved: (input) {
                    context.read<OrderEntity>().shippingAddressEntity!.name =
                        input;
                  },
                  label: Text('الاسم كامل'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  onSaved: (input) {
                    context.read<OrderEntity>().shippingAddressEntity!.email =
                        input;
                  },
                  label: Text('البريد الإلكتروني'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  onSaved: (input) {
                    context.read<OrderEntity>().shippingAddressEntity!.address =
                        input;
                  },
                  label: Text(' العنوان'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  onSaved: (input) {
                    context.read<OrderEntity>().shippingAddressEntity!.city =
                        input;
                  },
                  label: Text(' المدينه'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  onSaved: (input) {
                    context
                        .read<OrderEntity>()
                        .shippingAddressEntity!
                        .address2 = input;
                  },
                  label: Text(' رقم الطابق , رقم الشقه ..'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  onSaved: (input) {
                    context
                        .read<OrderEntity>()
                        .shippingAddressEntity!
                        .phoneNumber = input;
                  },
                  label: Text(' رقم التليفون'),
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 8,
                ),
                Switch(
                  value: isSelected,
                  onChanged: (value) {
                    isSelected = !isSelected;
                  },
                  activeColor: Colors.amber,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_Field.dart';

class AddressInputSection extends StatefulWidget {
  AddressInputSection({super.key});

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> {
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            label: Text('الاسم كامل'),
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            label: Text('البريد الإلكتروني'),
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            label: Text(' العنوان'),
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            label: Text(' المدينه'),
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            label: Text(' رقم الطابق , رقم الشقه ..'),
            keyBoardType: TextInputType.name,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
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
              setState(() {
                
              });
            },
            activeColor: Colors.amber,
          )
        ],
      ),
    );
  }
}

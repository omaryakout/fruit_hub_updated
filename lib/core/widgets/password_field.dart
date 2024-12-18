import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_Field.dart';

class PassWordField extends StatefulWidget {
  PassWordField({super.key, required this.onSaved});
  void Function(String?)? onSaved;

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  bool obsecureText = true ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved:widget.onSaved,
      obsecureText: obsecureText,
      keyBoardType: TextInputType.streetAddress,
      suffixIcon: GestureDetector(
        child: Icon(
        obsecureText?  Icons.remove_red_eye_outlined : Icons.visibility_off ,
        ),
        onTap: () {
          obsecureText = !obsecureText;
          setState(() {
            
          });
        },
      ),
      label: Text('كلمة المرور'),
    );
  }
}

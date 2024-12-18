import 'package:flutter/material.dart';

class ErrorBar extends StatelessWidget {
   ErrorBar({super.key,required this.text});
final  String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text);
   
  }
}

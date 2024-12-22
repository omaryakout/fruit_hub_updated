import 'package:flutter/material.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({super.key, required this.onPressed, required this.icon, required this.iconColor, required this.color});
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Icon(icon,color: iconColor,) ,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        
      )),
    );
  }
}

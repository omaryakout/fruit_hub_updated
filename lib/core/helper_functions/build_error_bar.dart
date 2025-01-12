import 'package:flutter/material.dart';

void buildError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: 600),
  ));
}

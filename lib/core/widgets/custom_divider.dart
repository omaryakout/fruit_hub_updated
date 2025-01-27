import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_divider_with_text.dart';

import '../../core/utils/app_text_styles.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1,
          color: Color(0xffDDDFDF),
        )),
      ],
    );
  }
}

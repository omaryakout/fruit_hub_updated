import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageWidget extends StatelessWidget {
  PageWidget(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title,
      required this.uptext});
  final String image, backgroundImage;
  final String subtitle;
  final Widget title, uptext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                  left: 0, right: 0, bottom: 0, child: SvgPicture.asset(image)),
              uptext
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Title(color: Colors.black, child: title),
        SizedBox(
          height: 18,
        ),
        Text(
          subtitle,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

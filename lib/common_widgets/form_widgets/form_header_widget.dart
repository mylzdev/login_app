import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.imageHeight,
    required this.formTitle,
    required this.formSubtitle,
    required this.image,
    this.color,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightBetween,
  });

  final double? heightBetween;
  final double imageHeight;
  final String formTitle;
  final String formSubtitle;
  final String image;
  final Color? color;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          color: color,
          height: height * imageHeight,
        ),
        SizedBox(height: heightBetween),
        Text(
          formTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          formSubtitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

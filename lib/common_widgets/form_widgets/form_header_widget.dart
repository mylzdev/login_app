import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.imageHeight,
    required this.formTitle,
    required this.formSubtitle,
    required this.image,
  });

  final double imageHeight;
  final String formTitle;
  final String formSubtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height: height * imageHeight,
        ),
        Text(
          formTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          formSubtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

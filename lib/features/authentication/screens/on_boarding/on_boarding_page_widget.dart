import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_bording.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: AssetImage(model.image),
              height: size.height * model.height),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 5),
              Text(
                model.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black87),
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 140),
        ],
      ),
    );
  }
}

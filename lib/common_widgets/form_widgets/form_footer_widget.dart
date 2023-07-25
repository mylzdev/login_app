import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
    required this.loginOrSignup,
  });

  final String loginOrSignup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('OR'),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogo),
              width: 15,
            ),
            onPressed: () {},
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: loginOrSignup,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

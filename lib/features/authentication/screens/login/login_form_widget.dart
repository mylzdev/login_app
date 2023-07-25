import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight),
            TextFormField(
              enableSuggestions: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: tPassword,
                hintText: tPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye_sharp)),
                prefixIcon: const Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  tLogin.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
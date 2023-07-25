import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: tFullName,
                hintText: tFullName,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: tEmail,
                hintText: tEmail,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: tPhoneNo,
                hintText: tPhoneNo,
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: tPassword,
                hintText: tPassword,
                prefixIcon: const Icon(Icons.person_outline_outlined),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  tSignup.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

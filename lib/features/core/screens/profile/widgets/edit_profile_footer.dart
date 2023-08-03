import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class EditProfileFooter extends StatelessWidget {
  const EditProfileFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text.rich(
          TextSpan(
            text: tJoined,
            style: TextStyle(fontSize: 12),
            children: [
              TextSpan(
                text: tJoinedAt,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.redAccent.withOpacity(0.1),
            elevation: 0,
            side: BorderSide.none,
            foregroundColor: Colors.red,
            shape: const StadiumBorder(),
          ),
          onPressed: () {},
          child: const Text(tDelete),
        ),
      ],
    );
  }
}
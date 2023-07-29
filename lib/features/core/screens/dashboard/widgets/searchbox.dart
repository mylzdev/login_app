import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class DashboardSearchbox extends StatelessWidget {
  const DashboardSearchbox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tDashboardSearch,
            style: txtTheme.displayMedium
          ),
          const Icon(Icons.mic)
        ],
      ),
    );
  }
}
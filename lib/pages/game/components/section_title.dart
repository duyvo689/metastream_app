import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

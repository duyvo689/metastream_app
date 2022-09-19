import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

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

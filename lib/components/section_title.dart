import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class SectionTitleCenter extends StatelessWidget {
  const SectionTitleCenter({
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
          style: PrimaryFont.medium(26).copyWith(color: AppColors.dWhileColor),
        ),
      ],
    );
  }
}

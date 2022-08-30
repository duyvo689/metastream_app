import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title_1,
    required this.title_2,
  }) : super(key: key);
  final String title_1;
  final String title_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(TextSpan(style: AppStyles.TitleHome2, children: [
          TextSpan(
            text: title_1,
            style: AppStyles.TitleHome1,
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: title_2,
          ),
        ])),
      ],
    );
  }
}

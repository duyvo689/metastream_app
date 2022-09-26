import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_size.dart';

class NoContentProfile extends StatelessWidget {
  const NoContentProfile({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(100)),
        Center(
          child: Text(
            title,
            style:
                const TextStyle(color: AppColors.dPrimaryColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../values/app_size.dart';

class CircleLoading extends StatelessWidget {
  const CircleLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(100)),
        Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}

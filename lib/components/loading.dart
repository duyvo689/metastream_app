import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

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

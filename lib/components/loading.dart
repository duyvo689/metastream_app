import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.scale}) : super(key: key);
  final double scale;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(100)),
        Container(
          child: Center(
            child: Image.asset(cupertinoActivityIndicator, scale: scale),
          ),
        ),
      ],
    );
  }
}

class LoadingCenter extends StatelessWidget {
  const LoadingCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(cupertinoActivityIndicator, scale: 6),
    );
  }
}

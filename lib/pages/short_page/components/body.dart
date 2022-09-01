import 'package:flutter/material.dart';
import '../../../values/app_size.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: const <Widget>[],
        ),
      ),
    );
  }
}

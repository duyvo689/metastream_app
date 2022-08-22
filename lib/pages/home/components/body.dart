import 'package:flutter/material.dart';
import 'section_title.dart';
import 'search_field.dart';
import 'section_title.dart';
import 'stream_slide.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [SearchField(), StreamSlide()]),
    ));
  }
}

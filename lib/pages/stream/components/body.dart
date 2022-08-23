import 'package:flutter/material.dart';
import 'search_field.dart';
import '../../../components/stream_slide.dart';

class BodyStreamPage extends StatelessWidget {
  const BodyStreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        SearchField(),
        StreamSlide(),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          // child: Image.asset('assets/images/'),
        )
      ]),
    ));
  }
}

import 'package:flutter/material.dart';
import './components/body.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyStreamPage(),
    );
  }
}

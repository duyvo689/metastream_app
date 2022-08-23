import 'package:flutter/material.dart';

import '../../../values/app_size.dart';
import '../../../components/game_slide.dart';
import '../../../components/poplular_list.dart';
import '../../../components/stream_slide.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        SizedBox(
          height: 30,
        ),
        StreamSlide(),
        SizedBox(
          height: 30,
        ),
        GameSlide(),
        // Expanded(
        //     child: GridView(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2, childAspectRatio: 0.75),
        //   PopularList(),
        // )),
        PopularList(),
      ],
    );
  }
}

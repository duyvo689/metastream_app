import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

import 'game_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            // size.width < 600
            //     ? const CarouselWithIndicator(
            //         viewport: 0.9, width: 36, height: 3, style: 'center')
            //     : const CarouselWithIndicator(
            //         viewport: 1, width: 50, height: 4, style: 'center'),
            const SizedBox(height: 20),
            const _SectionTitle(
              title: "Trending Games",
            ),
            const SizedBox(height: 20),
            const GameList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: PrimaryFont.medium(26).copyWith(color: dWhileColor),
        ),
      ],
    );
  }
}

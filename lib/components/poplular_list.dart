import 'package:flutter/material.dart';
import 'title_home.dart';
import 'game_card.dart';
import 'popular_card.dart';
import 'stream_card.dart';

class PopularList extends StatelessWidget {
  const PopularList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const TitleHome(
          title_1: 'The Most',
          title_2: 'Popular',
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 18.0, // gap between adjacent chips
          runSpacing: 16, // gap between lines
          children: <Widget>[
            PopularCard(
              thumb: 'assets/images/stream1.png',
              avatar: '',
              name: '',
              des: '',
              press: () {},
            ),
            PopularCard(
              thumb: 'assets/images/hinh3.png',
              avatar: '',
              name: '',
              des: '',
              press: () {},
            ),
            PopularCard(
              thumb: 'assets/images/hinh.jpeg',
              avatar: '',
              name: '',
              des: '',
              press: () {},
            ),
            PopularCard(
              thumb: 'assets/images/hinh2.jpeg',
              avatar: '',
              name: '',
              des: '',
              press: () {},
            ),
            PopularCard(
              thumb: 'assets/images/hinh3.png',
              avatar: '',
              name: '',
              des: '',
              press: () {},
            ),
          ],
        )
      ],
    );
  }
}

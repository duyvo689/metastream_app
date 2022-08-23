import 'package:flutter/material.dart';

import 'title_home.dart';
import 'stream_card.dart';

class StreamSlide extends StatelessWidget {
  const StreamSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const TitleHome(
          title_1: 'Live channels',
          title_2: 'we think you’ll like',
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              StreamCard(
                category: 'Live',
                img: 'assets/images/stream1.png',
                press: () {},
              ),
              StreamCard(
                category: 'Live',
                img: 'assets/images/hinh2.jpeg',
                press: () {},
              ),
              StreamCard(
                category: 'Live',
                img: 'assets/images/hinh3.png',
                press: () {},
              ),
              StreamCard(
                category: 'Live',
                img: 'assets/images/hinh.jpeg',
                press: () {},
              ),
              StreamCard(
                category: 'Live',
                img: 'assets/images/stream1.png',
                press: () {},
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}

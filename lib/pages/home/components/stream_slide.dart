import 'package:flutter/material.dart';

import 'section_title.dart';
import 'stream_card.dart';

class StreamSlide extends StatelessWidget {
  const StreamSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Top streamers live',
          press: () {},
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              StreamCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
                press: () {},
              ),
              StreamCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
                press: () {},
              ),
              StreamCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
                press: () {},
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}

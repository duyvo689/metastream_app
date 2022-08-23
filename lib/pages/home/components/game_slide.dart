import 'package:flutter/material.dart';
import 'game_card.dart';

class GameSlide extends StatelessWidget {
  const GameSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GameCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
                press: () {},
              ),
              GameCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
                press: () {},
              ),
              GameCard(
                category: 'hi',
                img: 'assets/images/duyvo.jpg',
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

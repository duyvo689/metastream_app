import 'package:flutter/material.dart';
import '../pages/home/components/section_title.dart';
import 'game_card.dart';

class GameSlide extends StatelessWidget {
  const GameSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title_1: 'Categories',
          title_2: 'we think you’ll like',
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GameCard(
                img: 'assets/images/game2.png',
                press: () {},
              ),
              GameCard(
                img: 'assets/images/game1.png',
                press: () {},
              ),
              GameCard(
                img: 'assets/images/game3.png',
                press: () {},
              ),
              GameCard(
                img: 'assets/images/game2.png',
                press: () {},
              ),
              GameCard(
                img: 'assets/images/game1.png',
                press: () {},
              ),
              GameCard(
                img: 'assets/images/game3.png',
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

import 'package:flutter/material.dart';
import '../../../models/short.dart';
import '../../../values/app_size.dart';
import 'game_card.dart';
import 'section_title.dart';
import 'short_card.dart';

class PopularShorts extends StatelessWidget {
  const PopularShorts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SectionTitle(
            title_1: "Videos",
            title_2: "Short",
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  shortItem.length,
                  (index) => Container(
                    child: ShortCard(
                      shortItem: shortItem[index],
                      press: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

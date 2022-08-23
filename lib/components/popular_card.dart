import 'package:app_metastream/values/app_fonts.dart';
import 'package:app_metastream/values/app_styles.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key? key,
    required this.thumb,
    required this.avatar,
    required this.name,
    required this.des,
    required this.press,
  }) : super(key: key);
  final String thumb, name, des, avatar;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 180,
        height: 150,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Image border
                  child: SizedBox.fromSize(
                    child: Image.asset(thumb, fit: BoxFit.cover),
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage("assets/images/game1.png"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: const [
                        Text(
                          "NTTNoster",
                          style: AppStyles.nameCard,
                        ),
                        Text(
                          "NTTNoster",
                          style: AppStyles.desCard,
                        )
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}

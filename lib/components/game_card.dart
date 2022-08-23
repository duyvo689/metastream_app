import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.img,
    required this.press,
  }) : super(key: key);
  final String img;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
          width: 140,
          height: 190,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15)
                      ])),
                ),
              ],
            ),
          )),
    );
  }
}

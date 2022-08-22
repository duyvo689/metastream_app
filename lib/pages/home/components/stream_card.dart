import 'package:flutter/material.dart';

class StreamCard extends StatelessWidget {
  const StreamCard({
    Key? key,
    required this.category,
    required this.img,
    required this.press,
  }) : super(key: key);
  final String category, img;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
          width: 350,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text.rich(
                      TextSpan(style: TextStyle(color: Colors.red), children: [
                    TextSpan(
                        text: category,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ])),
                )
              ],
            ),
          )),
    );
  }
}

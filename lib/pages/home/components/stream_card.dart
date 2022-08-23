import 'package:app_metastream/values/app_colors.dart';
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
          width: 320,
          height: 180,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text.rich(TextSpan(
                      style: const TextStyle(
                          color: Colors.red,
                          backgroundColor: AppColors.bgLiveColor),
                      children: [
                        TextSpan(
                            text: category,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          )),
    );
  }
}

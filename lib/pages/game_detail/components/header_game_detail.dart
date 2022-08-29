import 'package:flutter/material.dart';
import 'package:app_metastream/values/app_colors.dart';
import '../../../values/app_size.dart';

class HeaderGameDetail extends StatelessWidget {
  const HeaderGameDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://sm.ign.com/ign_in/cover/a/avatar-rec/avatar-reckoning_36ct.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              iconSize: 36,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.navigate_before),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: getProportionateScreenHeight(90),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Teamfight Tactics",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: AppColors.primaryColor,
                            onPrimary: AppColors.firstColor,
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        onPressed: () {},
                        child: const Text('following'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: '7.2M',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Followers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textPrimaryColor,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye_rounded,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                text: '534.8K',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' viewers',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.textPrimaryColor,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

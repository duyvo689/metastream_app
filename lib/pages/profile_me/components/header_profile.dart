import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class HeaderProflie extends StatelessWidget {
  const HeaderProflie({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user != null && user.avatar != null
                      ? user.avatar.toString()
                      : 'https://ecdn.game4v.com/g4v-content/uploads/2016/07/lmht_kute-1-480x480.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.01)
                ])),
          ),
          Positioned(
            top: getProportionateScreenHeight(220),
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user != null &&
                                user.firstName != null &&
                                user.lastName != null
                            ? "${user.firstName!} ${user.lastName!}"
                            : "Unknow",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.dWhileColor,
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)),
                      //       primary: AppColors.dPrimaryColor,
                      //       onPrimary: AppColors.dBlackColor,
                      //       textStyle: const TextStyle(
                      //           fontSize: 14, fontWeight: FontWeight.w600)),
                      //   onPressed: () {},
                      //   child: Text('following'),
                      // ),
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
                          text: TextSpan(
                            text: '0',
                            style: const TextStyle(
                                color: AppColors.dPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: ' Followers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.dWhileColor,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     const Icon(
                        //       Icons.remove_red_eye_rounded,
                        //       size: 16,
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     RichText(
                        //       text: const TextSpan(
                        //         text: '0',
                        //         style: TextStyle(
                        //             color: AppColors.dPrimaryColor,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.bold),
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: ' viewers',
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.w400,
                        //                   color: AppColors.dWhileColor,
                        //                   fontSize: 15)),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
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

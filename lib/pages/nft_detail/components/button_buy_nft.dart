import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_size.dart';

class ButtonBuyNft extends StatelessWidget {
  const ButtonBuyNft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('Buy now'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  primary: AppColors.primaryColor,
                  onPrimary: AppColors.firstColor,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(50),
                      right: getProportionateScreenWidth(50))),
            ),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("Make an offer"),
              style: OutlinedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  side:
                      const BorderSide(color: AppColors.primaryColor, width: 1),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30))),
            )
          ],
        ),
        RichText(
          text: const TextSpan(
            text: 'By clicking "Buy now" or "Make an offer", you agree to the',
            style: TextStyle(
                color: AppColors.textSecondColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: ' Magic Eden Terms of Service.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimaryColor,
                      fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

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
              // ignore: sort_child_properties_last
              child: const Text('Buy now'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  primary: AppColors.dPrimaryColor,
                  onPrimary: AppColors.dBlackColor,
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
                  primary: AppColors.dPrimaryColor,
                  side: const BorderSide(
                      color: AppColors.dPrimaryColor, width: 1),
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
                color: AppColors.dGreyLightColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: ' Magic Eden Terms of Service.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.dWhileColor,
                      fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}

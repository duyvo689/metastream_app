import 'package:app_metastream/pages/nft_detail/components/table_nft.dart';
import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_size.dart';
import 'dropdown_price.dart';
import 'expansion_cart.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/nft1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Text(
          'Double Jump #567',
          textAlign: TextAlign.start,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            fontSize: 26,
          ),
        ),
        Row(
          children: [
            const Text(
              'Double Jump',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.primaryColor),
            ),
            TextButton.icon(
              onPressed: () {
                // Respond to button press
              },
              icon: const Icon(
                Icons.share,
                size: 16,
                color: AppColors.primaryColor,
              ),
              label: const Text("Share",
                  style: TextStyle(color: AppColors.primaryColor)),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            color: AppColors.bgrCardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Current Price',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.textSecondColor),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    Icons.local_offer,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3 sol',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: AppColors.textPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const DropdownPrice(),
              const SizedBox(height: 20),
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
                        side: const BorderSide(
                            color: AppColors.primaryColor, width: 1),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                            right: getProportionateScreenWidth(30))),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: const TextSpan(
                  text:
                      'By clicking "Buy now" or "Make an offer", you agree to the',
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
          ),
        ),
        const SizedBox(height: 20),
        const ExpansionCart(),
        const SizedBox(height: 20),
        const TableNFT(),
        const SizedBox(height: 20),
      ],
    ));
  }
}

import 'package:app_metastream/values/app_assets.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/short.dart';
import '../../../values/app_size.dart';

class ShortCard extends StatelessWidget {
  const ShortCard({
    Key? key,
    required this.shortItem,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final ShortItem shortItem;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(160),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                    image: DecorationImage(
                        image: AssetImage(shortItem.image), fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 0.0,
                bottom: getProportionateScreenHeight(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shortItem.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    const Text(
                      '#short#minecaft#minecrafthacks',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${shortItem.views.toString()} views",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

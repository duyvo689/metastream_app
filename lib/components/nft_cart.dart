import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/nft.dart';
import '../values/app_size.dart';

class NFTCard extends StatelessWidget {
  const NFTCard({
    Key? key,
    required this.nftList,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final NFTlist nftList;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(color: AppColors.textSecondColor),
            color: AppColors.bgrMainColor.withOpacity(0.3)),
        child: SizedBox(
          width: getProportionateScreenWidth(150),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.94,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(nftList.image), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(150),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nftList.name,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      nftList.chain,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.paid,
                          color: Colors.deepPurple,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          nftList.price,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            color: AppColors.textPrimaryColor,
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
    );
  }
}
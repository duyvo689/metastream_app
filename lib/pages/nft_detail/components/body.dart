import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'expansion_cart.dart';
import 'table_nft.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
          child: AspectRatio(
            aspectRatio: 1.1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                image: DecorationImage(
                  image: NetworkImage(nftSolana.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                nftSolana.name!,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                nftSolana.name!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
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
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.textSecondColor),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.local_offer,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${nftSolana.price} sol',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: AppColors.textPrimaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ExpansionCart(nftSolana: nftSolana),
        const SizedBox(height: 20),
        TableNFT(mintAddress: nftSolana.mintAddress.toString()),
        const SizedBox(height: 20),
      ],
    ));
  }
}

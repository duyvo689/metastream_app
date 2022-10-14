import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/utils/utils.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/body.dart';

class NFTMagicEdenDetail extends StatelessWidget {
  const NFTMagicEdenDetail({Key? key, required this.nftMagicEden})
      : super(key: key);
  final MagicEdenNft nftMagicEden;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dBlackColor,
        appBar: AppBar(
          backgroundColor: AppColors.dBlackColor,
          actions: <Widget>[
            RawMaterialButton(
              onPressed: () => phantomLaunchURLApp(
                  'NFT/solana/item-details/${nftMagicEden.tokenMint}'),
              child: Image.asset(
                AppAssets.icPhantom,
                height: 35,
                width: 35,
              ),
            ),
          ],
        ),
        body: SafeArea(child: Body(nftSolana: nftMagicEden)));
  }
}

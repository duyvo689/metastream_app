import 'package:app_metastream/models/models.dart';
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
    _launchURLApp() async {
      var url =
          'https://phantom.app/ul/browse/https://staging.metastream.network/NFT/solana/item-details/${nftMagicEden.tokenMint}';
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
        backgroundColor: AppColors.dBlackColor,
        appBar: AppBar(
          backgroundColor: AppColors.dBlackColor,
          actions: <Widget>[
            RawMaterialButton(
              onPressed: _launchURLApp,
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

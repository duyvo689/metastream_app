import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/body.dart';

class NFTDetail extends StatelessWidget {
  const NFTDetail({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;

  _launchURLApp() async {
    var url =
        'https://phantom.app/ul/browse/https://staging.metastream.network/NFT/solana/${nftSolana.mintAddress}';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgrMainColor,
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
      body: SafeArea(child: Body(nftSolana: nftSolana)),
    );
  }
}

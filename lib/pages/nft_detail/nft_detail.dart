import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/utils/utils.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class NFTDetail extends StatelessWidget {
  const NFTDetail({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.dBlackColor,
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () =>
                phantomLaunchURLApp('NFT/solana/${nftSolana.mintAddress}'),
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

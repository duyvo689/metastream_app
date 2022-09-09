import 'package:app_metastream/models/nft_solana.dart';
import 'package:flutter/material.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import 'components/body.dart';

class NFTDetail extends StatelessWidget {
  const NFTDetail({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgrMainColor,
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            child: Image.asset(
              AppAssets.icPhantom,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: Body(nftSolana: nftSolana),
    );
  }
}

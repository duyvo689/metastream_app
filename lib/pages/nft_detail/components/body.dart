import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'table_nft.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.nftSolana}) : super(key: key);
  final NftSolana nftSolana;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width < 600
        ? SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImageNFT(nftSolana: nftSolana),
                _NameNFT(nftSolana: nftSolana),
                const SizedBox(height: 20),
                _CurrentPrice(nftSolana: nftSolana),
                const SizedBox(height: 20),
                _DetailInfoNFT(nftSolana: nftSolana),
                const SizedBox(height: 20),
                TableNFT(mintAddress: nftSolana.mintAddress.toString()),
                const SizedBox(height: 20),
              ],
            ),
          ))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Align(
                        child: _ImageNFT(nftSolana: nftSolana),
                        alignment: Alignment.topCenter,
                      )),
                      Expanded(
                        child: Column(
                          children: [
                            _NameNFT(nftSolana: nftSolana),
                            const SizedBox(height: 20),
                            _CurrentPrice(nftSolana: nftSolana),
                            const SizedBox(height: 20),
                            _DetailInfoNFT(nftSolana: nftSolana),
                            const SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                  TableNFT(mintAddress: nftSolana.mintAddress.toString()),
                ],
              ),
            ),
          );
  }
}

class _DetailInfoNFT extends StatelessWidget {
  const _DetailInfoNFT({
    Key? key,
    required this.nftSolana,
  }) : super(key: key);

  final NftSolana nftSolana;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: AppColors.bgrCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.description,
                size: 24,
                color: AppColors.dPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Details',
                textAlign: TextAlign.start,
                style: PrimaryFont.light(22)
                    .copyWith(color: AppColors.dGreyLightColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _RowDetailInfoNFT(
              name: 'Mint address',
              info:
                  '${nftSolana.mintAddress.toString().substring(0, 6)}...${nftSolana.mintAddress.toString().substring(nftSolana.mintAddress.toString().length - 6, nftSolana.mintAddress.toString().length)}'),
          const SizedBox(height: 10),
          _RowDetailInfoNFT(
              name: 'Seller address',
              info:
                  '${nftSolana.sellerAddress.toString().substring(0, 6)}...${nftSolana.sellerAddress.toString().substring(nftSolana.sellerAddress.toString().length - 6, nftSolana.sellerAddress.toString().length)}'),
          const SizedBox(height: 10),
          _RowDetailInfoNFT(
              name: 'Token Account',
              info:
                  '${nftSolana.tokenAccount.toString().substring(0, 6)}...${nftSolana.tokenAccount.toString().substring(nftSolana.tokenAccount.toString().length - 6, nftSolana.tokenAccount.toString().length)}'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Row _RowDetailInfoNFT({required String name, required String info}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          textAlign: TextAlign.start,
          style: PrimaryFont.light(18).copyWith(color: AppColors.dWhileColor),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.icSol),
              radius: 10,
            ),
            const SizedBox(width: 5),
            Text(
              info,
              textAlign: TextAlign.start,
              style: PrimaryFont.light(18).copyWith(
                  color: AppColors.dGreyLightColor,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ],
    );
  }
}

class _CurrentPrice extends StatelessWidget {
  const _CurrentPrice({
    Key? key,
    required this.nftSolana,
  }) : super(key: key);

  final NftSolana nftSolana;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        color: AppColors.bgrCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Price',
            style: PrimaryFont.light(22)
                .copyWith(color: AppColors.dGreyLightColor),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.local_offer,
                color: AppColors.dPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${nftSolana.price} sol',
                style: PrimaryFont.medium(26)
                    .copyWith(color: AppColors.dWhileColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageNFT extends StatelessWidget {
  const _ImageNFT({
    Key? key,
    required this.nftSolana,
  }) : super(key: key);

  final NftSolana nftSolana;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 20),
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
              image: CachedNetworkImageProvider(nftSolana.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _NameNFT extends StatelessWidget {
  const _NameNFT({
    Key? key,
    required this.nftSolana,
  }) : super(key: key);

  final NftSolana nftSolana;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nftSolana.name!,
          textAlign: TextAlign.start,
          maxLines: 2,
          style: PrimaryFont.medium(28.0).copyWith(
            color: AppColors.dWhileColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nftSolana.name!,
          textAlign: TextAlign.start,
          style:
              PrimaryFont.light(22.0).copyWith(color: AppColors.dPrimaryColor),
        ),
        // AutoSizeText(
        //   'The text to display',
        //   style: TextStyle(fontSize: 20),
        //   maxLines: 2,
        // )
      ],
    );
  }
}

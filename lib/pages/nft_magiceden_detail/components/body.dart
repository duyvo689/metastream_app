// ignore_for_file: non_constant_identifier_names

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/magicedennft_detail_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'table_magiceden_nft.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.nftSolana}) : super(key: key);
  final MagicEdenNft nftSolana;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  MagicEdenNftDetail? magicEdenNft;

  @override
  void initState() {
    fetchNftMagicEdenNfts(widget.nftSolana.tokenMint.toString());
    super.initState();
  }

  Future fetchNftMagicEdenNfts(String tokenMint) async {
    MagicEdenNftDetail response =
        await ApiCollectionServices().fetchTokenListingDataMagicEden(tokenMint);
    setState(() {
      magicEdenNft = response;
    });
  }

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
                _ImageNFT(nftSolana: widget.nftSolana),
                magicEdenNft != null
                    ? Column(
                        children: [
                          _NameNFT(
                              nftSolana: magicEdenNft as MagicEdenNftDetail),
                          const SizedBox(height: 20),
                          _CurrentPrice(
                              nftSolana: magicEdenNft as MagicEdenNftDetail),
                          const SizedBox(height: 20),
                          _DetailInfoNFT(
                              nftSolana: magicEdenNft as MagicEdenNftDetail),
                        ],
                      )
                    : Container(height: 350, child: const InfoNftSkeleton()),
                const SizedBox(height: 20),
                TableNFTMagicEden(
                    tokenMint: widget.nftSolana.tokenMint.toString()),
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
                        // ignore: sort_child_properties_last
                        child: _ImageNFT(nftSolana: widget.nftSolana),
                        alignment: Alignment.topCenter,
                      )),
                      magicEdenNft != null
                          ? Expanded(
                              child: Column(
                              children: [
                                _NameNFT(
                                    nftSolana:
                                        magicEdenNft as MagicEdenNftDetail),
                                const SizedBox(height: 20),
                                _CurrentPrice(
                                    nftSolana:
                                        magicEdenNft as MagicEdenNftDetail),
                                const SizedBox(height: 20),
                                _DetailInfoNFT(
                                    nftSolana:
                                        magicEdenNft as MagicEdenNftDetail),
                              ],
                            ))
                          : const LoadingCenter(),
                    ],
                  ),
                  TableNFTMagicEden(
                      tokenMint: widget.nftSolana.tokenMint.toString()),
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

  final MagicEdenNftDetail nftSolana;

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
              name: 'Owner address',
              info:
                  '${nftSolana.owner.toString().substring(0, 6)}...${nftSolana.owner.toString().substring(nftSolana.owner.toString().length - 6, nftSolana.owner.toString().length)}'),
          const SizedBox(height: 10),
          // _RowDetailInfoNFT(
          //     name: 'Token Account',
          //     info:
          //         '${nftSolana.tokenAccount.toString().substring(0, 6)}...${nftSolana.tokenAccount.toString().substring(nftSolana.tokenAccount.toString().length - 6, nftSolana.tokenAccount.toString().length)}'),
          // const SizedBox(height: 10),
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

  final MagicEdenNftDetail nftSolana;

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
                '${nftSolana.sellerFeeBasisPoints} sol',
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

  final MagicEdenNft nftSolana;

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
              image:
                  CachedNetworkImageProvider(nftSolana.extra!.img.toString()),
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

  final MagicEdenNftDetail nftSolana;

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
      ],
    );
  }
}

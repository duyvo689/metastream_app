// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/magicedennft_detail_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'magiceden_nft_cart.dart';

class CollectionDetail extends StatefulWidget {
  const CollectionDetail({Key? key, required this.collection})
      : super(key: key);
  final Collection collection;
  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  List<MagicEdenNftDetail>? magicEdenNftDetailList;
  List<MagicEdenNft>? magicEdenNftList;
  StatsMagicEden? statsMagicEden;
  @override
  void initState() {
    fetchStatMagicEdenNfts(widget.collection.symbol.toString());
    fetchNftMagicEdenNfts(widget.collection.symbol.toString());
    super.initState();
  }

  Future fetchNftMagicEdenNfts(String symbol) async {
    List<MagicEdenNftDetail> listNft = [];
    List<MagicEdenNft> response =
        await ApiCollectionServices().fetchNftMagicEdenBySymbol(symbol);
    if (!mounted) return;
    setState(() {
      magicEdenNftList = response;
    });
  }

  Future fetchStatMagicEdenNfts(String symbol) async {
    StatsMagicEden response =
        await ApiCollectionServices().fetchStatsMagicEdenBySymbol(symbol);
    if (!mounted) return;
    setState(() {
      statsMagicEden = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.dBlackColor,
        actions: const <Widget>[],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            widget.collection.image.toString()),
                        radius: 67,
                      ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: -10,
                      child: SvgPicture.asset(
                        'assets/images/solana-sol-icon.svg',
                        semanticsLabel: 'sol',
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.collection.name.toString(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                statsMagicEden != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              _CardStats(
                                  name: 'FLOOR',
                                  value: statsMagicEden!.magic!.floorPrice
                                      .toString()),
                              const SizedBox(height: 5),
                              _CardStats(
                                  name: 'AVG. SALE (24h)',
                                  value: statsMagicEden!.magic!.avgPrice24Hr
                                      .toString()),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              _CardStats(
                                  name: 'LISTED',
                                  value: statsMagicEden!.magic!.listedCount
                                      .toString()),
                              const SizedBox(height: 5),
                              _CardStats(
                                  name: 'TOTAL VOL',
                                  value: statsMagicEden!.magic!.volumeAll
                                      .toString()),
                            ],
                          )
                        ],
                      )
                    : const ListStatCollectionSkeleton(),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(color: Colors.grey, height: 4),
                ),
                const SizedBox(height: 20),
                magicEdenNftList != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.6,
                              crossAxisCount: 2,
                            ),
                            itemCount: magicEdenNftList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NFTCardMagicEden(
                                nft: magicEdenNftList![index],
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NFTMagicEdenDetail(
                                                  nftMagicEden:
                                                      magicEdenNftList![
                                                          index])));
                                },
                              );
                            }),
                      )
                    : const ListCollectionSkeleton(
                        columnCount: 2, direction: Axis.vertical),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardStats extends StatelessWidget {
  const _CardStats({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);
  final String name, value;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.dPrimaryDarkBigColor,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 50,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            name,
            style: const TextStyle(
                color: AppColors.dGreyLightColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name == 'LISTED'
                    ? '${value}'
                    : value != 'null'
                        ? '${value.substring(0, 2)}.${value.substring(2, 3)}${name == 'TOTAL VOL' ? 'T' : 'G'}'
                        : '16.5G',
                style: const TextStyle(
                    color: AppColors.dWhileColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(width: 5),
              name == 'LISTED'
                  ? const SizedBox.shrink()
                  : SvgPicture.asset(
                      'assets/images/solana-sol-icon.svg',
                      semanticsLabel: 'sol',
                      width: 17,
                      height: 17,
                      fit: BoxFit.cover,
                    ),
            ],
          )
        ]),
      ),
    );
  }
}

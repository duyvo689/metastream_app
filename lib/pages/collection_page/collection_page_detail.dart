// ignore_for_file: unused_local_variable

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
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
  List<MagicEdenNft>? magicEdenNftList;
  StatsMagicEden? statsMagicEden;
  @override
  void initState() {
    fetchStatMagicEdenNfts(widget.collection.symbol.toString());
    fetchNftMagicEdenNfts(widget.collection.symbol.toString());
    super.initState();
  }

  Future fetchNftMagicEdenNfts(String symbol) async {
    List<MagicEdenNft> response =
        await ApiCollectionServices().fetchNftMagicEdenBySymbol(symbol);
    setState(() {
      magicEdenNftList = response;
    });
  }

  Future fetchStatMagicEdenNfts(String symbol) async {
    StatsMagicEden response =
        await ApiCollectionServices().fetchStatsMagicEdenBySymbol(symbol);
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
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.collection.image.toString()),
                    radius: 67,
                  ),
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
                                  name: 'floorPrice',
                                  value: statsMagicEden!.magic!.floorPrice
                                      .toString()),
                              const SizedBox(height: 5),
                              _CardStats(
                                  name: 'avgPrice24hr',
                                  value: statsMagicEden!.magic!.avgPrice24Hr
                                      .toString()),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              _CardStats(
                                  name: 'listedCount',
                                  value: statsMagicEden!.magic!.listedCount
                                      .toString()),
                              const SizedBox(height: 5),
                              _CardStats(
                                  name: 'volumeAll',
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
      color: Colors.blueGrey[600],
      child: Container(
        alignment: Alignment.center,
        width: 160,
        height: 60,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            name,
            style: const TextStyle(
                color: AppColors.dGreyLightColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${value.substring(0, 2)}.${value.substring(2, 3)}${name == 'volumeAll' ? 'T' : 'G'}',
                style: const TextStyle(
                    color: AppColors.dWhileColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                'assets/images/solana-sol-icon.svg',
                semanticsLabel: 'sol',
                width: 18,
                height: 18,
                fit: BoxFit.cover,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

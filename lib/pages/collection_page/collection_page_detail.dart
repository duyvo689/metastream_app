// ignore_for_file: unused_local_variable

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
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
  @override
  void initState() {
    fetchMagicEdenNfts(widget.collection.symbol.toString());
    super.initState();
  }

  Future fetchMagicEdenNfts(String symbol) async {
    List<MagicEdenNft> response =
        await ApiCollectionServices().fetchMagicEdenBySymbol(symbol);
    setState(() {
      magicEdenNftList = response;
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
                  backgroundImage:
                      NetworkImage(widget.collection.image.toString()),
                  radius: 60,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.collection.name.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const _CardStats(),
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
                                press: () {},
                              );
                            }),
                      )
                    : const LoadingCenter(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      child: Container(
        alignment: Alignment.center,
        width: 140,
        height: 60,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Duy vo',
            style: TextStyle(
                color: AppColors.dGreyLightColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '1.2',
                style: TextStyle(
                    color: AppColors.dWhileColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              SvgPicture.asset(
                'assets/images/solana-sol-icon.svg',
                semanticsLabel: 'sol',
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ],
          )
        ]),
      ),
    );
  }
}

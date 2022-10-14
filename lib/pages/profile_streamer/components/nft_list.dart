import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:flutter/material.dart';

class NFTList extends StatelessWidget {
  const NFTList({
    Key? key,
    required this.nftSolanas,
  }) : super(key: key);
  final List<NftSolana>? nftSolanas;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: nftSolanas!.length > 0
            ? GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: 0.63,
                ),
                itemCount: nftSolanas!.length,
                itemBuilder: (BuildContext context, int index) {
                  return NFTCard(
                    nftSolana: nftSolanas![index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NFTDetail(
                                  nftSolana: nftSolanas![index],
                                ))),
                  );
                },
              )
            : const NoContentProfile(title: "User don't have nft!"),
      ),
    );
  }
}

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class NFTList extends StatelessWidget {
  const NFTList({
    Key? key,
    required this.collection,
  }) : super(key: key);
  final String collection;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<List<NftSolana>>(
          future: ApiNftSolanaServices()
              .fetchNftsSolanaByCollectionGame(collection),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              // ignore: curly_braces_in_flow_control_structures
              return const Loading(scale: 6);
            List<NftSolana>? nftSolanas = snapshot.data;
            return nftSolanas != null && nftSolanas.length > 0
                ? GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                      childAspectRatio: 0.63,
                    ),
                    itemCount: nftSolanas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NFTCard(
                        nftSolana: nftSolanas[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NFTDetail(
                                      nftSolana: nftSolanas[index],
                                    ))),
                      );
                    },
                  )
                : const NoContentProfile(title: "Game don't have nft!");
          },
        ),
      ),
    );
  }
}

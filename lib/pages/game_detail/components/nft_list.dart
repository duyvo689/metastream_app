import 'package:flutter/material.dart';
import '../../../models/nft.dart';
import '../../nft_detail/nft_detail.dart';
import '../../../components/nft_cart.dart';

class NFTList extends StatelessWidget {
  const NFTList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: 0.63,
          ),
          itemCount: nfts.length,
          itemBuilder: (BuildContext context, int index) {
            return NFTCard(
              nft: nfts[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NFTDetail(
                            nft: nfts[index],
                          ))),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../models/nft.dart';
import '../../nft_detail/nft_detail.dart';
import 'nft_cart.dart';

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
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 0.5,
          ),
          itemCount: nftList.length,
          itemBuilder: (BuildContext context, int index) {
            return NFTCard(
              nftList: nftList[index],
              //  product: products[index],
              //           press: () => Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => DetailsScreen(
              //                   product: products[index],
              //                 ),
              //               )),
              //         )),
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NFTDetail(
                            nftList: nftList[index],
                          ))),
            );
          },
        ),
      ),
    );
  }
}

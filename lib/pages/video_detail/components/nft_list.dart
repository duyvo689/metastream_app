import 'package:flutter/material.dart';

class NFTList extends StatelessWidget {
  const NFTList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SingleChildScrollView(
        //   clipBehavior: Clip.none,
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       ...List.generate(
        //         nfts.length,
        //         (index) => Padding(
        //           padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        //           child: NFTCard(
        //             nft: nfts[index],
        //             press: () => Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => NFTDetail(
        //                           nft: nfts[index],
        //                         ))),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 20,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

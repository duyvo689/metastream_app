import 'package:flutter/material.dart';
import '../../../components/no_content_profile.dart';
import '../../../models/nft_solana.dart';
import '../../../services/api_seller_nft_solana_service.dart';
import '../../nft_detail/nft_detail.dart';
import '../../../components/nft_cart.dart';

class NFTList extends StatelessWidget {
  const NFTList({
    Key? key,
    required this.addressWallet,
  }) : super(key: key);
  final String addressWallet;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<List<NftSolana>>(
          future: ApiNftSolanaServices().fetchSellerByAddress(addressWallet),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            List<NftSolana>? nftSolanas = snapshot.data;
            return nftSolanas!.length > 0
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
                    itemCount: nftSolanas!.length,
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
                : const NoContentProfile(title: "You don't have nft!");
          },
        ),
      ),
    );
  }
}

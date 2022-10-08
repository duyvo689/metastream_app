// ignore_for_file: prefer_is_empty, curly_braces_in_flow_control_structures

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/user_info_provider.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NFTList extends StatelessWidget {
  const NFTList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (context, userInfoConsumer, child) {
        return userInfoConsumer.userInfo != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder<List<NftSolana>>(
                  future: ApiNftSolanaServices().fetchSellerByAddress(
                      userInfoConsumer.userInfo!.addressWallet.toString()),
                  builder: (context, snapshot) {
                    if ((snapshot.hasError) || (!snapshot.hasData))
                      return const Loading(scale: 6);
                    List<NftSolana>? nftSolanas = snapshot.data;
                    return nftSolanas!.length > 0
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                        : const NoContentProfile(title: "You don't have nft!");
                  },
                ),
              )
            : const Loading(scale: 6);
        ;
      },
    );
  }
}

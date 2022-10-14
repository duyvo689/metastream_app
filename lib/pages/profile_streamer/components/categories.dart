import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'nft_list.dart';
import 'video_list.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  List categories = ['Streams', 'NFTs', 'About'];

  User? user;
  List<Video>? videos;
  List<NftSolana>? nftSolanas;

  @override
  void initState() {
    fetchUser(widget.userId.toString());
    fetchVideosOfUser(widget.userId);
    super.initState();
  }

  Future fetchUser(String id) async {
    User response = await ApiUserServices().fetchUserById(id);
    if (!mounted) return;
    setState(() {
      user = response;
    });
    fetchNftsOfUser(response.addressWallet.toString());
  }

  Future<void> fetchVideosOfUser(String id) async {
    List<Video>? response = await ApiVideoServices().fetchVideosOfUser(id);
    setState(() {
      videos = response;
    });
  }

  Future<void> fetchNftsOfUser(String addressWallet) async {
    List<NftSolana>? response =
        await ApiNftSolanaServices().fetchSellerByAddress(addressWallet);
    setState(() {
      nftSolanas = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: index == selectedIndex
                      ? Border.all(color: AppColors.dPrimaryColor)
                      : Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontWeight: selectedIndex == index
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 18,
                      color: index == selectedIndex
                          ? AppColors.dPrimaryColor
                          : Colors.white),
                ),
              ),
            ),
          ),
        ),
        if (selectedIndex == 0) ...[
          videos != null ? VideoList(videos: videos) : const Loading(scale: 6),
        ],
        if (selectedIndex == 1) ...[
          nftSolanas != null
              ? NFTList(nftSolanas: nftSolanas)
              : const Loading(scale: 6),
        ],
        if (selectedIndex == 2) ...[
          user != null ? AboutProfile(user: user) : const Loading(scale: 6)
        ],
      ]),
    );
  }
}

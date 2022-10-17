import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'nft_list.dart';
import 'video_list.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['Streams', 'NFTs', 'About'];

  List<Video>? videos;
  List<NftSolana>? nftSolanas;

  @override
  void initState() {
    fetchVideosOfUser(widget.user.id!);
    fetchNftsOfUser(widget.user.addressWallet!);
    super.initState();
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
          videos != null ? VideoList(videos: videos) : const Loading(scale: 7),
        ],
        if (selectedIndex == 1) ...[
          nftSolanas != null
              ? NFTList(nftSolanas: nftSolanas)
              : const Loading(scale: 7),
        ],
        if (selectedIndex == 2) ...[
          widget.user != null
              ? AboutProfile(user: widget.user)
              : const Loading(scale: 7)
        ],
      ]),
    );
  }
}

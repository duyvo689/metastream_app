import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'nft_list.dart';
import 'video_list.dart';

// We need statefull widget because we are gonna change some state on our category
class Categories extends StatefulWidget {
  const Categories(
      {Key? key, required this.addressWallet, required this.userId})
      : super(key: key);
  final String addressWallet;
  final String userId;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['Streams', 'NFTs', 'About'];
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
        if (selectedIndex == 0) ...[VideoList(userId: widget.userId)],
        if (selectedIndex == 1) ...[
          NFTList(addressWallet: widget.addressWallet),
        ],
        if (selectedIndex == 2) ...[AboutProfile(userId: widget.userId)],
      ]),
    );
  }
}

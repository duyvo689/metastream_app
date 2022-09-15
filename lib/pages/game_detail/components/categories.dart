import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'video_list.dart';

// We need statefull widget because we are gonna change some state on our category
class Categories extends StatefulWidget {
  const Categories({Key? key, required this.gameId}) : super(key: key);
  final String gameId;
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
      child: Column(
        children: [
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
                        ? Border.all(color: AppColors.primaryColor)
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
                            ? AppColors.primaryColor
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ),
          if (selectedIndex == 0) ...[VideoList(gameId: widget.gameId)],
          // if (selectedIndex == 1) ...[
          //   NFTList(addressWallet: widget.addressWallet),
          // ],
          if (selectedIndex == 2) ...[AboutProfile(gameId: widget.gameId)],
        ],
      ),
    );
  }
}

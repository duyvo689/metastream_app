import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Just Chatting",
    "IRL",
    "Music",
    "Esports",
    "Jewellery",
    "Chatting",
    "Dresses"
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        height: 46,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(right: 30, left: 30, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.bgrChipColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.w500
                        : FontWeight.w400,
                    color: selectedIndex == index ? Colors.black : Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

// We need statefull widget because we are gonna change some state on our category
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = [
    "Just Chatting",
    "IRL",
    "Music",
    "Esports",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 36,
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
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? AppColors.dPrimaryColor
                  : AppColors.bgrChipColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontWeight:
                    selectedIndex == index ? FontWeight.w600 : FontWeight.w500,
                fontSize: 16,
                color: selectedIndex == index ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

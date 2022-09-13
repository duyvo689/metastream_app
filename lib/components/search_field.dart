import 'package:flutter/material.dart';
import '../values/app_colors.dart';
import '../values/app_size.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          // Container(
          //   width: SizeConfig.screenWidth * 0.89333,
          //   height: 40,
          //   decoration: BoxDecoration(
          //       border:
          //           Border.all(width: 1.0, color: AppColors.borderGrayColor),
          //       color: AppColors.grayColor,
          //       borderRadius: BorderRadius.circular(20)),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(
          //         horizontal: getProportionateScreenWidth(20),
          //         vertical: getProportionateScreenWidth(10),
          //       ),
          //       enabledBorder: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       hintText: "Search stream...",
          //       prefixIcon: const Icon(
          //         Icons.search,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

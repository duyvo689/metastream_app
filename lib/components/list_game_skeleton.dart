import 'package:flutter/material.dart';

import 'card_skeleton.dart';

class ListGameSkeleton extends StatelessWidget {
  const ListGameSkeleton({
    Key? key,
    required this.columnCount,
  }) : super(key: key);
  final int columnCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisCount: columnCount,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const CardSkeleton();
      },
    );
  }
}

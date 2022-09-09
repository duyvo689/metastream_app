import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import 'skeleton.dart';

class CardSkeleton extends StatelessWidget {
  const CardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 180,
      height: 260,
      child: const SkeletonItem(
        child: square_skeleton(
          height: 2,
          width: 220,
        ),
      ),
    );
  }
}

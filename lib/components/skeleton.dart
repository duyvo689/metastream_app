import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SquareSkeleton extends StatelessWidget {
  const SquareSkeleton({Key? key, this.width, required this.height})
      : super(key: key);
  final int height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        width: width != null ? double.infinity : width,
        height: MediaQuery.of(context).size.height / height,
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size}) : super(key: key);
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
          shape: BoxShape.circle, width: size, height: size),
    );
  }
}

class ParagraphSkeleton extends StatelessWidget {
  const ParagraphSkeleton(
      {Key? key, required this.line, this.height, this.width})
      : super(key: key);
  final double? height, width;
  final int line;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SkeletonParagraph(
        style: SkeletonParagraphStyle(
            lines: line,
            spacing: 10,
            lineStyle: SkeletonLineStyle(
              randomLength: true,
              height: height,
              borderRadius: BorderRadius.circular(8),
              minLength: MediaQuery.of(context).size.width / 4,
              maxLength: MediaQuery.of(context).size.width / 2,
            )),
      ),
    );
  }
}

class VideoCardSkelton extends StatelessWidget {
  const VideoCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Column(
      children: [
        const SquareSkeleton(height: 4),
        const SizedBox(height: 8),
        Row(
          children: const [
            CircleSkeleton(size: 50),
            SizedBox(width: 8),
            ParagraphSkeleton(line: 2, height: 16)
          ],
        ),
      ],
    ));
  }
}

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
        child: SquareSkeleton(
          height: 2,
          width: 220,
        ),
      ),
    );
  }
}

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

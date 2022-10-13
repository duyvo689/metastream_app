// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SquareSkeleton extends StatelessWidget {
  const SquareSkeleton({Key? key, this.width, required this.height})
      : super(key: key);
  final double height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        width: width != null ? width : double.infinity,
        height: height,
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
    return SkeletonParagraph(
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
        const SquareSkeleton(height: 230),
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
      margin: const EdgeInsets.only(right: 10),
      width: 180,
      height: 260,
      child: const SkeletonItem(
        child: SquareSkeleton(
          height: 230,
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

class ListCollectionSkeleton extends StatelessWidget {
  const ListCollectionSkeleton({
    Key? key,
    required this.columnCount,
    required this.direction,
  }) : super(key: key);
  final int columnCount;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: direction,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 0,
        crossAxisCount: columnCount,
        childAspectRatio: 1,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const CardSkeleton();
      },
    );
  }
}

class ListStatCollectionSkeleton extends StatelessWidget {
  const ListStatCollectionSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 3.5,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const SkeletonItem(
            child: SquareSkeleton(
              height: 60,
              width: 150,
            ),
          );
        },
      ),
    );
  }
}

class InfoNftSkeleton extends StatelessWidget {
  const InfoNftSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: Column(
        children: const [
          SizedBox(height: 20),
          ParagraphSkeleton(line: 2, height: 18),
          SizedBox(height: 20),
          SquareSkeleton(height: 80),
          SizedBox(height: 20),
          SquareSkeleton(height: 140),
        ],
      ),
    );
  }
}

class ListCommentSkeleton extends StatelessWidget {
  const ListCommentSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            CircleSkeleton(size: 40),
            ParagraphSkeleton(line: 2, height: 20)
          ],
        ),
      ),
    );
  }
}

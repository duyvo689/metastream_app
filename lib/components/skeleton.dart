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

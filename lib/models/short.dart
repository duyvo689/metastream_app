import 'package:flutter/material.dart';

class ShortItem {
  final String name, image, tag;
  final int views;

  ShortItem({
    required this.name,
    required this.image,
    required this.tag,
    required this.views,
  });
}

List<ShortItem> shortItem = [
  ShortItem(
    name: "Craziest End ever!😳",
    tag: "Red",
    views: 12093,
    image: "assets/images/short1.png",
  ),
  ShortItem(
    name: "Craziest End ever!😳",
    tag: "black",
    views: 123243,
    image: "assets/images/short2.png",
  ),
  ShortItem(
    name: "Megical World",
    tag: "black",
    views: 3214321,
    image: "assets/images/short3.png",
  ),
  ShortItem(
    name: "Craziest End ever!😳",
    tag: "black",
    views: 123243,
    image: "assets/images/short1.png",
  ),
  ShortItem(
    name: "Craziest End ever!😳",
    tag: "Red",
    views: 12093,
    image: "assets/images/short3.png",
  ),
  ShortItem(
    name: "Megical World",
    tag: "black",
    views: 123243,
    image: "assets/images/short2.png",
  ),
  ShortItem(
    name: "Megical World",
    tag: "black",
    views: 3214321,
    image: "assets/images/short3.png",
  ),
];

import 'package:flutter/material.dart';

class TravelSpot {
  final String name, image, tag;
  final int follower;

  TravelSpot({
    required this.name,
    required this.image,
    required this.tag,
    required this.follower,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    name: "Mountains  Mountains Mountains",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game1.png",
  ),
  TravelSpot(
    name: "Megical World",
    tag: "black",
    follower: 123243,
    image: "assets/images/game2.png",
  ),
  TravelSpot(
    name: "Megical World",
    tag: "black",
    follower: 3214321,
    image: "assets/images/game3.png",
  ),
  TravelSpot(
    name: "Megical World",
    tag: "black",
    follower: 123243,
    image: "assets/images/game2.png",
  ),
  TravelSpot(
    name: "Red Mountains",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game1.png",
  ),
  TravelSpot(
    name: "Megical World",
    tag: "black",
    follower: 123243,
    image: "assets/images/game2.png",
  ),
  TravelSpot(
    name: "Megical World",
    tag: "black",
    follower: 3214321,
    image: "assets/images/game3.png",
  ),
];

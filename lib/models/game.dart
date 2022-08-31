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
    name: "Tiny Colony",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game1.jpeg",
  ),
  TravelSpot(
    name: "ev.io",
    tag: "black",
    follower: 123243,
    image: "assets/images/game2.png",
  ),
  TravelSpot(
    name: "Legends of Aria",
    tag: "black",
    follower: 3214321,
    image: "assets/images/game3.jpeg",
  ),
  TravelSpot(
    name: "Milton on Mars",
    tag: "black",
    follower: 123243,
    image: "assets/images/game4.jpeg",
  ),
  TravelSpot(
    name: "Neoland",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game5.jpeg",
  ),
  TravelSpot(
    name: "Psyker",
    tag: "black",
    follower: 123243,
    image: "assets/images/game6.jpeg",
  ),
];

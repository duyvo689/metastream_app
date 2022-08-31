class Game {
  final String name, image, tag;
  final int follower;

  Game({
    required this.name,
    required this.image,
    required this.tag,
    required this.follower,
  });
}

List<Game> games = [
  Game(
    name: "Tiny Colony",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game1.jpeg",
  ),
  Game(
    name: "ev.io",
    tag: "black",
    follower: 123243,
    image: "assets/images/game2.png",
  ),
  Game(
    name: "Legends of Aria",
    tag: "black",
    follower: 3214321,
    image: "assets/images/game3.jpeg",
  ),
  Game(
    name: "Milton on Mars",
    tag: "black",
    follower: 123243,
    image: "assets/images/game4.jpeg",
  ),
  Game(
    name: "Neoland",
    tag: "Red",
    follower: 12093,
    image: "assets/images/game5.jpeg",
  ),
  Game(
    name: "Psyker",
    tag: "black",
    follower: 123243,
    image: "assets/images/game6.jpeg",
  ),
];

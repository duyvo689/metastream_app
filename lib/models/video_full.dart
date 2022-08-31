class VideosItem {
  final String nameVideo, avatar, nameChannel, thumbnail;
  final int views;

  VideosItem({
    required this.nameVideo,
    required this.avatar,
    required this.nameChannel,
    required this.thumbnail,
    required this.views,
  });
}

List<VideosItem> videosItem = [
  VideosItem(
    nameVideo: "NFTs In Gaming... Are We Doomed?",
    nameChannel: "Kevinh Duong",
    avatar: "assets/images/avt1.jpeg",
    views: 1209,
    thumbnail: "assets/images/thumb1.png",
  ),
  VideosItem(
    nameVideo:
        "Blockchain Games Explained | What are NFT Games? Ethereum & Enjin NFT Play to Earn Examples",
    nameChannel: "Khoi Tran",
    avatar: "assets/images/avt2.jpeg",
    views: 1209,
    thumbnail: "assets/images/thumb2.jpeg",
  ),
  VideosItem(
    nameVideo:
        "Cash grab or innovation? The video game world is divided over NFTs",
    nameChannel: "Duy Vo",
    avatar: "assets/images/avt3.jpeg",
    views: 1209,
    thumbnail: "assets/images/thumb3.png",
  ),
  VideosItem(
    nameVideo: "10 Upcoming NFT Games To Watch Out For | Play-to-earn gaming",
    nameChannel: "Bryan",
    avatar: "assets/images/avt4.jpeg",
    views: 1209,
    thumbnail: "assets/images/thumb4.jpeg",
  ),
  VideosItem(
    nameVideo:
        "10 Upcoming NFT Games to Get Excited About | Play-to-earn of the future",
    nameChannel: "Duy Vo",
    avatar: "assets/images/avt5.jpeg",
    views: 1209,
    thumbnail: "assets/images/thumb5.jpeg",
  ),
];

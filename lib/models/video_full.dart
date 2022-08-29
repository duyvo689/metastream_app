import 'package:flutter/material.dart';

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
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Sınıfında Red",
    avatar: "assets/images/avt1.png",
    views: 1209,
    thumbnail: "assets/images/stream1.png",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni",
    nameChannel: "Red Sınıfında",
    avatar: "assets/images/avt2.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh3.png",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Red",
    avatar: "assets/images/avt3.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh2.jpeg",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Red Sınıfında",
    avatar: "assets/images/avt2.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh.jpeg",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Sınıfında Red",
    avatar: "assets/images/avt1.png",
    views: 1209,
    thumbnail: "assets/images/stream1.png",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni",
    nameChannel: "Red Sınıfında",
    avatar: "assets/images/avt2.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh3.png",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Red",
    avatar: "assets/images/avt3.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh2.jpeg",
  ),
  VideosItem(
    nameVideo: "Sınıfında en iyisi | Yeni Macbook Air M2 inceleme",
    nameChannel: "Red Sınıfında",
    avatar: "assets/images/avt2.jpeg",
    views: 1209,
    thumbnail: "assets/images/hinh.jpeg",
  ),
];

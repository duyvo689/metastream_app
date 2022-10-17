import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'nft_list.dart';
import 'video_list.dart';

// We need statefull widget because we are gonna change some state on our category
class Categories extends StatefulWidget {
  const Categories({Key? key, required this.gameId, required this.collection})
      : super(key: key);
  final String gameId, collection;
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Video>? videos;
  List<NftSolana>? nftSolanas;
  Game? game;

  @override
  void initState() {
    fetchVideosOfGame(widget.gameId.toString());
    fetchNftsOfGame(widget.collection);
    fetchGameById(widget.gameId);
    super.initState();
  }

  Future<void> fetchVideosOfGame(String gameId) async {
    if (gameId != 'null' && gameId != null) {
      List<Video>? response =
          await ApiVideoServices().fetchVideosOfGame(gameId);
      setState(() {
        videos = response;
      });
    }
  }

  Future<void> fetchGameById(String gameId) async {
    if (gameId != 'null' && gameId != null) {
      Game? response = await ApiGameServices().fetchGameById(gameId);
      setState(() {
        game = response;
      });
    }
  }

  Future<void> fetchNftsOfGame(String collection) async {
    List<NftSolana>? response = await ApiNftSolanaServices()
        .fetchNftsSolanaByCollectionGame(collection);
    setState(() {
      nftSolanas = response;
    });
  }

  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['Streams', 'NFTs', 'About'];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: index == selectedIndex
                        ? Border.all(color: AppColors.dPrimaryColor)
                        : Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontWeight: selectedIndex == index
                            ? FontWeight.w600
                            : FontWeight.w500,
                        fontSize: 18,
                        color: index == selectedIndex
                            ? AppColors.dPrimaryColor
                            : Colors.white),
                  ),
                ),
              ),
            ),
          ),
          if (selectedIndex == 0) ...[
            videos != null ? VideoList(videos: videos) : const Loading(scale: 6)
          ],
          if (selectedIndex == 1) ...[
            nftSolanas != null
                ? NFTList(nftSolanas: nftSolanas)
                : const Loading(scale: 6),
          ],
          if (selectedIndex == 2) ...[
            game != null ? AboutProfile(game: game) : const Loading(scale: 6)
          ],
        ],
      ),
    );
  }
}

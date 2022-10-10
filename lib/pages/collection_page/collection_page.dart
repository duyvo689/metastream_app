// ignore_for_file: sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/collection_page/collection_page_detail.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class NftPage extends StatefulWidget {
  const NftPage({Key? key}) : super(key: key);

  @override
  State<NftPage> createState() => _NftPageState();
}

class _NftPageState extends State<NftPage> {
  @override
  void initState() {
    fetchCollections();
    super.initState();
  }

  Future fetchCollections() async {
    await context.read<CollectionProvider>().GetCollectionsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dBlackColor,
        appBar: AppBar(
          backgroundColor: AppColors.dBlackColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Discover',
                    style: TextStyle(
                        color: AppColors.dWhileColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Find your favourite streamer.',
                    style: TextStyle(
                        color: AppColors.dGreyLightColor, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          actions: const <Widget>[],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RefreshIndicator(
              color: Colors.white,
              backgroundColor: AppColors.dPrimaryDarkColor,
              onRefresh: () async {
                await fetchCollections();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(height: 35),
                    SectionTitleCenter(title: 'Solana Collections'),
                    SizedBox(height: 30),
                    ListCollectionSolana(direction: Axis.vertical, count: 2),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ListCollectionSolana extends StatelessWidget {
  const ListCollectionSolana({
    Key? key,
    required this.count,
    required this.direction,
  }) : super(key: key);
  final int count;
  final Axis direction;
  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionProvider>(
        builder: (context, collectionConsumer, child) {
      return collectionConsumer.collectionList != null
          ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: direction,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                crossAxisCount: count,
                childAspectRatio: 0.95,
              ),
              itemCount: collectionConsumer.collectionList!.length,
              itemBuilder: (BuildContext context, int index) {
                return _NftCard(
                    collection: collectionConsumer.collectionList![index],
                    press: () => pushNewScreen(
                          context,
                          screen: CollectionDetail(
                              collection:
                                  collectionConsumer.collectionList![index]),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ));
              })
          : count == 1
              ? Container(
                  height: 200,
                  child: ListCollectionSkeleton(
                      columnCount: count, direction: direction))
              : ListCollectionSkeleton(
                  columnCount: count, direction: direction);
    });
  }
}

class _NftCard extends StatelessWidget {
  const _NftCard({Key? key, required this.collection, required this.press})
      : super(key: key);
  final Collection collection;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(
                color: const Color.fromARGB(255, 51, 50, 50), width: 2),
            color: AppColors.dBlackColor.withOpacity(0.3)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(collection.image.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: getProportionateScreenWidth(150),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      collection.name.toString(),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      collection.name.toString(),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: AppColors.dPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

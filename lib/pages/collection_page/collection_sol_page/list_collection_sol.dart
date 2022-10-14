// ignore_for_file: sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'collection_page_detail.dart';

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
      return collectionConsumer.collectionSolList != null
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
              itemCount: collectionConsumer.collectionSolList!.length,
              itemBuilder: (BuildContext context, int index) {
                return CollectionNftCard(
                    collection: collectionConsumer.collectionSolList![index],
                    press: () => pushNewScreen(
                          context,
                          screen: CollectionDetail(
                              collection:
                                  collectionConsumer.collectionSolList![index]),
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

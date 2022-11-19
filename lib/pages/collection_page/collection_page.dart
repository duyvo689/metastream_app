// ignore_for_file: sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'collection_sol_page/list_collection_sol.dart';

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

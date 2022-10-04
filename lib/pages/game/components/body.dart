import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_metastream/funtions/funtions.dart';

import 'game_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    fetchGameList();
  }

  Future fetchGameList() async {
    await context.read<GameListProvider>().GetGameListProvider();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Container(
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.dPrimaryDarkColor,
        onRefresh: () async {
          await fetchGameList();
        },
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              size.width < 600
                  ? const CarouselWithIndicator(
                      viewport: 0.96, width: 36, height: 3, style: 'center')
                  : const CarouselWithIndicator(
                      viewport: 1, width: 50, height: 4, style: 'center'),
              const SizedBox(height: 20),
              const _SectionTitle(
                title: "Trending Games",
              ),
              const SizedBox(height: 20),
              const GameList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: PrimaryFont.medium(26).copyWith(color: AppColors.dWhileColor),
        ),
      ],
    );
  }
}

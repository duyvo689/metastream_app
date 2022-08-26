import 'package:app_metastream/values/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../home/components/body.dart';
import '../home/components/body2.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color mainColor = AppColors.secondColor;
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgrMainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Discover',
                  style: TextStyle(
                      color: AppColors.textPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Find your favourite streamer.',
                  style:
                      TextStyle(color: AppColors.textSecondColor, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            child: Image.asset(
              AppAssets.icPhantom,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          Body2(),
          Text("index 2"),
          Text("index 2"),
          Text("index 2"),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style12,
        backgroundColor: AppColors.bgrBottomBarColor,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house_fill),
        title: ("Home"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.time_solid),
        title: ("Time"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bookmark_solid),
        title: ("Bookmark"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chart_bar_square_fill),
        title: ("Chart"),
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

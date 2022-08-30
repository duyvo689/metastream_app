import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../game/game_page.dart';
import '../home/home_page.dart';

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
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          MyHomePage(),
          GamePage(),
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

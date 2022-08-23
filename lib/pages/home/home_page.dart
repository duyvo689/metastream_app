import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../../components/bottom_navbar.dart';
import './components/body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_fire_department,
            ),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.widgets,
            ),
            label: 'App',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Notify',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: (Column(
//           children: const [Body()],
//         )),
//       ),
//       bottomNavigationBar:
//     );
//   }
// BottomNavigationBar(items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "Home",
//         ),
//       ]),

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.bgrColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.account_circle),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.question_answer),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.video_call),
        onPressed: () {},
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}

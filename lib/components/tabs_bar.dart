// import 'package:flutter/material.dart';

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       child: DefaultTabController(
//         initialIndex: 1,
//         length: 3,
//         child: Column(
//           children: [
//             AppBar(
//               title: const Text('TabBar Widget'),
//               bottom: const TabBar(
//                 tabs: <Widget>[
//                   Tab(
//                     icon: Icon(Icons.cloud_outlined),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.beach_access_sharp),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.brightness_5_sharp),
//                   ),
//                 ],
//               ),
//             ),
//             const TabBarView(
//               children: <Widget>[
//                 Center(
//                   child: Text("It's cloudy here"),
//                 ),
//                 Center(
//                   child: Text("It's rainy here"),
//                 ),
//                 Center(
//                   child: Text("It's sunny here"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

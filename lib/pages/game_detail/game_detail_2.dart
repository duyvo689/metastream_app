// import 'package:app_metastream/models/models.dart';
// import 'package:app_metastream/values/values.dart';
// import 'package:flutter/material.dart';

// import 'components/categories.dart';
// import 'components/video_list.dart';

// class GameDetail2 extends StatelessWidget {
//   const GameDetail2({Key? key, this.game, this.gameId, this.collection})
//       : super(key: key);
//   final Game? game;
//   final String? gameId, collection;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgrMainColor,
//       appBar: AppBar(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Flexible(
//                     flex: 1,
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundColor: Colors.white,
//                       child: CircleAvatar(
//                         radius: 58.5,
//                         backgroundImage: NetworkImage(
//                             'https://cnn-bitcoin.com/wp-content/uploads/2022/04/1200x720_10-860x516-1.jpg'),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Flexible(
//                     flex: 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Helions',
//                           style: PrimaryFont.medium(40)
//                               .copyWith(color: dWhileColor),
//                           maxLines: 1,
//                         ),
//                         Text(
//                           'Việc phát hành bộ sưu tập hình đại diện NFT được chờ đợi nhiều, “Novatar” ra mắt vào ngày 4 tháng 4. Bộ sưu tập 25.000 avatar trẻ em sẽ được bán trong 3 đợt bao gồm 10 đợt bán hàng. Mỗi đợt sẽ bán được 1000 avatar trẻ em. Mỗi 1000 hình đại diện sẽ đắt hơn 0,01 ETH.',
//                           style: PrimaryFont.light(20).copyWith(
//                               color: dGreyLightColor,
//                               overflow: TextOverflow.ellipsis,
//                               height: 1.2),
//                           maxLines: 3,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   _StatesButton(
//                     icon: Icon(
//                       Icons.visibility,
//                       size: 35,
//                     ),
//                     label: '0 views',
//                   ),
//                   SizedBox(width: 20),
//                   _StatesButton(
//                     icon: Icon(
//                       Icons.favorite_border,
//                       size: 35,
//                     ),
//                     label: '1203k likes',
//                   ),
//                   SizedBox(width: 20),
//                   _StatesButton(
//                     icon: Icon(
//                       Icons.add_circle_outline,
//                       size: 35,
//                     ),
//                     label: '13k follow',
//                   ),
//                 ],
//               ),
//               Categories(
//                 gameId: "631f093965833b6fa5151442",
//                 collection: "8eat8FVdeMhhZtapH3Hk86evFHdseajp7rbxKEbYDRuA",
//               ),
//               VideoList(gameId: "631f093965833b6fa5151442")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _StatesButton extends StatelessWidget {
//   const _StatesButton({
//     Key? key,
//     required this.icon,
//     required this.label,
//   }) : super(key: key);

//   final Icon icon;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: (() {}),
//           icon: icon,
//         ),
//         Text("${label}")
//       ],
//     );
//   }
// }

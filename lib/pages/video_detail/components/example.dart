//  Expanded(
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: ElevatedButton(
//                   child: const Text('Comment'),
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4)),
//                       primary: AppColors.dPrimaryDarkColor,
//                       onPrimary: AppColors.dWhileColor,
//                       shadowColor: AppColors.dGreyLightColor,
//                       textStyle: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w600)),
//                   onPressed: () {
//                     showModalBottomSheet<void>(
//                       context: context,
//                       backgroundColor: Colors.transparent,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return Container(
//                           height: size.height * 0.7,
//                           decoration: const BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10.0),
//                                   topRight: Radius.circular(10.0))),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(width: 50),
//                                     const Text(
//                                       'Comments',
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                           overflow: TextOverflow.ellipsis,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 15,
//                                           color: AppColors.dWhileColor),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(
//                                         Icons.close,
//                                         size: 20,
//                                       ),
//                                       onPressed: () => Navigator.pop(context),
//                                     ),
//                                   ],
//                                 ),
//                                 CommentContainer(video: video),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
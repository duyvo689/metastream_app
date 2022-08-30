// import 'package:comment_box/comment/comment.dart';
// import 'package:flutter/material.dart';

// class TestMe extends StatefulWidget {
//   const TestMe({Key? key}) : super(key: key);

//   @override
//   _TestMeState createState() => _TestMeState();
// }

// class _TestMeState extends State<TestMe> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   List filedata = [
//     {
//       'name': 'Adeleye Ayodeji',
//       'pic': 'https://picsum.photos/300/30',
//       'message': 'I love to code'
//     },
//   ];

//   Widget commentChild(data) {
//     return ListView(
//       children: [
//         for (var i = 0; i < data.length; i++)
//           Padding(
//             padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
//             child: ListTile(
//               leading: GestureDetector(
//                 onTap: () async {
//                   // Display the image in large form.
//                   print("Comment Clicked");
//                 },
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//                   decoration: const BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.all(Radius.circular(50))),
//                   child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(data[i]['pic'])),
//                 ),
//               ),
//               title: Text(
//                 data[i]['name'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(data[i]['message']),
//             ),
//           )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       child: Container(
//         child: CommentBox(
//           userImage:
//               "https://toigingiuvedep.vn/wp-content/uploads/2021/01/avatar-dep-cute.jpg",
//           child: commentChild(filedata),
//           labelText: 'Write a comment...',
//           withBorder: false,
//           errorText: 'Comment cannot be blank',
//           sendButtonMethod: () {
//             if (formKey.currentState!.validate()) {
//               print(commentController.text);
//               setState(() {
//                 var value = {
//                   'name': 'New User',
//                   'pic':
//                       'https://toigingiuvedep.vn/wp-content/uploads/2021/01/avatar-dep-cute.jpg',
//                   'message': commentController.text
//                 };
//                 filedata.insert(0, value);
//               });
//               commentController.clear();
//               FocusScope.of(context).unfocus();
//             } else {
//               print("Not validated");
//             }
//           },
//           formKey: formKey,
//           commentController: commentController,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

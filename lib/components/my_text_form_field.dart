// import 'package:flutter/material.dart';

// class MyTextFormField extends StatelessWidget {
//   final String hintText;
//   final Function validator;
//   final Function onSaved;
//   final bool isEmail;
//   final Icon icon;

//   MyTextFormField({
//     required this.onSaved,
//     this.isEmail = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: TextFormField(
//         decoration: InputDecoration(
//           hintText: hintText,
//           contentPadding: EdgeInsets.all(15.0),
//           border: InputBorder.none,
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//         obscureText: isPassword ? true : false,
//         validator: validator,
//         onSaved: onSaved,
//         keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//       ),
//     );
//   }
// }

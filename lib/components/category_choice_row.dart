// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/bloc/category/category_event.dart';
//
// import '../bloc/category/category_bloc.dart';
// import '../bloc/category/category_state.dart';
// import '../bloc/news_bloc.dart';
// import '../bloc/news_event.dart';
// import '../bloc/news_state.dart';
//
// //images/categories_choice/business1.jpg
// class CategoryTile extends StatelessWidget {
//   final String imgUrl;
//   final String text;
//
//   CategoryTile({required this.imgUrl, required this.text});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//
//               borderRadius: BorderRadius.circular(20),
//             ),
//             height: 200,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(imgUrl,
//                   fit: BoxFit.cover,
//                   height: double.infinity,
//                   width: double.infinity),
//             ),
//             // color: Colors.red,
//           ),
//           Container(
//
//             height: 200,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           InkWell(
//                 onTap: () {
//
//                 },
//                 child:  Container(
//                           alignment: Alignment.center,
//
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 80,),
//                               Text(text, style: TextStyle(fontSize: 25,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'LexendDeca'),),
//
//
//                             ],)
//     ),
//
//
//
//                 ),
//               );
//             },
//           ),
//
//   }
// }
//

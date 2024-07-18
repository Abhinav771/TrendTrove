import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      width: 300,
      decoration: BoxDecoration(
        color:Color(0XFFC3C3C3),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 48),
            child: Icon(Icons.search,size: 30,color:Colors.white),
          ),
          Text('Search',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),),
        ],),
    );
  }
}

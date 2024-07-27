import 'package:flutter/material.dart';

class CategoryChoice extends StatefulWidget {

  final String imgPath;

  const CategoryChoice({super.key, required this.imgPath});



  @override
  State<CategoryChoice> createState() => _CategoryChoiceState();
}

class _CategoryChoiceState extends State<CategoryChoice> {
  var colour =Colors.red;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
          ),
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(widget.imgPath,
                fit:BoxFit.cover,height: double.infinity,width:double.infinity),
          ),
          // color: Colors.red,
        ),
        Container(

          height: 200,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   // Adjust opacity here
        //   decoration: BoxDecoration(
        //     color: Colors.black.withOpacity(1),
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        // ),
      ],
    );
  }
}

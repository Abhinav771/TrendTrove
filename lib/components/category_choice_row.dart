import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//images/categories_choice/business1.jpg
class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String text;

  CategoryTile({required this.imgUrl,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),
            ),
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imgUrl,
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
          InkWell(
            onTap: (){

            },
            child: Container(
                alignment: Alignment.center,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80,),
                    Text(text, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'LexendDeca'),



                    ),],)
            ),
          ),
        ],
      ),
    );
  }
}


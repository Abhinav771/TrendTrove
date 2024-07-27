import 'package:flutter/material.dart';
import 'package:news_app/utilities/constants.dart';

class NewsTile extends StatelessWidget {
  final String newsImg;
  final String headline;
  final String category;


  const NewsTile({super.key, required this.newsImg, required this.headline, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,right:8),
            child: Container(
                height:150,
                width:150,
                child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(newsImg,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,),
                    )
                )
            ),
          ),
          Expanded(
            // height: 150,
            //
            // color: Colors.red,
            child: Container(
              // color: Colors.red,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right:8),
                  child: Text(category,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: blueColor,fontFamily: 'LexendDeca'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    // textAlign: TextAlign.center,
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(left:8.0,right:8),
                  child:  Text(headline,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'LexendDeca'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    // textAlign: TextAlign.center,
                  ),
                )
              ],
                        ),
            ),)
        ],),
      ),
    );
  }
}

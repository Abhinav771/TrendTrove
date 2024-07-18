import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String newsImg;
  final String headline;

  const NewsTile({super.key, required this.newsImg, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
          Container(
            height: 150,
            color: Colors.red,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8),
                child: Text(headline,
                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal),
                ),
              ),Padding(
                padding: const EdgeInsets.only(left:8.0,right:8),
                child: Text(headline,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),)
        ],),
      ),
    );
  }
}

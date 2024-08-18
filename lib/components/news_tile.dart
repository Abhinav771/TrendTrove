import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/utilities/constants.dart';

class NewsTile extends StatelessWidget {
  final String newsImg;
  final String headline;
  final String category;
  final String description;
  final String sourceName;
  final String sourceIcon;



  const NewsTile({super.key, required this.newsImg, required this.headline, required this.category, required this.description, required this.sourceName, required this.sourceIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allow the bottom sheet to be sized according to its content
          builder: (BuildContext context) {
            return SingleChildScrollView( // Make the content scrollable
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensure Column sizes to its children
                children: [
                  Stack(
                    clipBehavior: Clip.none, // Ensure the Stack doesn't clip children
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Container(
                          height: 400, // Adjust height as needed or remove if dynamic height is desired
                          width: double.infinity,
                          color: Colors.red,
                          child: Image.network(
                            newsImg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Icon(Icons.arrow_back, size: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Icon(Icons.bookmark_border, size: 30, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              headline,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                              softWrap: true,// Adjust text alignment
                            ),
                          ),
                      ),
                    ],
                  ),


                  Container(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize:16,color: Theme.of(context).secondaryHeaderColor),
                      textAlign: TextAlign.center, // Adjust text alignment

                    ),
                  ),
                  SizedBox(height: 16),
                  // Add spacing
                  // Container(
                  //   color: Theme.of(context).primaryColor,
                  //   child: Center(
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text('Close'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );





      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left:0.0,right:8),
              child: Container(
                  margin: EdgeInsets.all(8),
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
                    child: Container(
                      // height: 25,
                      // width: 120,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(category.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8),
                    child:  Text(headline,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15,color: Theme.of(context).secondaryHeaderColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      // textAlign: TextAlign.center,
                    ),
                  )
                ],
                          ),
              ),)
          ],),
        ),
      ),
    );
  }
}

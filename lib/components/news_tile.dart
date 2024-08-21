import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bookmark/bookmark_event.dart';
import 'package:news_app/utilities/constants.dart';

import '../bloc/bookmark/bookmark_bloc.dart';
import '../bloc/bookmark/bookmark_state.dart';

class NewsTile extends StatelessWidget {
  final String articleId;
  final String newsImg;
  final String headline;
  final String category;
  final String description;
  final String sourceName;
  final String sourceIcon;



  const NewsTile({super.key, required this.newsImg, required this.headline, required this.category, required this.description, required this.sourceName, required this.sourceIcon, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          backgroundColor: Color(0XFF232531),
          // backgroundColor: Theme.of(context).primaryColor,
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
                          color: blueColor,
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
                      BlocBuilder<BookmarkBloc, BookmarkState>(
                        builder: (context, state) {
                          bool isBookmarked = false;
                          if (state is FinalBookmarkState) {
                            isBookmarked = state.bookmarkMap[articleId] ?? false;
                          }

                          return Positioned(
                            top: 30,
                            right: 30,
                            child: GestureDetector(
                              onTap: () {
                                if (isBookmarked) {
                                  context.read<BookmarkBloc>().add(RemoveBookmark(articleId: articleId));
                                } else {
                                  context.read<BookmarkBloc>().add(AddBookmark(
                                    sourceName: sourceName,
                                    sourceIcon: sourceIcon,
                                    description: description,
                                    category: category,
                                    newsImg: newsImg,
                                    headline: headline,
                                    articleId: articleId,
                                  ));
                                }
                              },
                              child: Container(
                                child: Icon(
                                  isBookmarked ? Icons.bookmark_added_rounded : Icons.bookmark_border,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,bottom: 8),
                              child: Container(
                              decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(category.toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                              ),
                            ),
                              Container(
                                width: double.infinity,
                            color: Theme.of(context).primaryColor.withOpacity(0.7),
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    headline,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                                    textAlign: TextAlign.start,
                                    softWrap: true,
                                  ),
                                )
                              ],),
                          ),
                          ],)


                      ),
                      // Positioned(
                      //   top: 325, // Fixed position from the top
                      //   left: 0,
                      //   right: 0,
                      //   bottom: 0, // Ensures the container doesn't overflow the screen
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Theme.of(context).primaryColor,
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(15.0),
                      //         topRight: Radius.circular(15.0),
                      //       ),
                      //     ),
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: SingleChildScrollView(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               CircleAvatar(
                      //                 radius: 30, // Adjust the radius as needed
                      //                 backgroundImage: NetworkImage(sourceIcon),
                      //               ),
                      //               SizedBox(width: 10), // Add spacing between the avatar and text
                      //               Expanded(
                      //                 child: Text(
                      //                   sourceName,
                      //                   style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      //                     fontSize: 26,
                      //                     color: Theme.of(context).secondaryHeaderColor,
                      //                   ),
                      //                   textAlign: TextAlign.start, // Align text to the start
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 10), // Add spacing between rows
                      //           Text(
                      //             description,
                      //             style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      //               fontSize: 16,
                      //               color: Theme.of(context).secondaryHeaderColor,
                      //             ),
                      //             textAlign: TextAlign.start, // Adjust text alignment
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(width: 20,),
                          CircleAvatar(

                            backgroundImage: NetworkImage(sourceIcon),
                            radius: 30,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            sourceName,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).secondaryHeaderColor),
                            overflow: TextOverflow.ellipsis, // Adds '...' at the end if text overflows
                            maxLines: 1, // Limits the text to a single line
                          ),


                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: double.infinity,
                          // color: Theme.of(context).primaryColor.withOpacity(0.7),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  description,
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16,color: Theme.of(context).secondaryHeaderColor),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              )
                            ],),
                        ),
                      ),
                    ],),
                  ),
                  







                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Theme.of(context).primaryColor,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(15.0),
                  //       topRight: Radius.circular(15.0),
                  //     ),
                  //   ),
                  //
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     description,
                  //     style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize:16,color: Theme.of(context).secondaryHeaderColor),
                  //     textAlign: TextAlign.center, // Adjust text alignment
                  //
                  //   ),
                  // ),
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

import 'package:flutter/material.dart';

import '../components/category_choice.dart';
import '../components/category_choice_row.dart';
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,fontFamily: 'LexendDeca'),),
          centerTitle: true,
        ),
        body: Container(
          child: Column(children: [
            SizedBox(height: 30,),
            Expanded(child: SingleChildScrollView(
              child: Column(children: [

                Row(children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CategoryTile(
                      imgUrl: 'images/categories_choice/business1.jpg',
                      text: 'Business',
                    ),
                  ),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(top:16,right:16,bottom: 16,left: 8),
                    child: CategoryTile(
                      imgUrl: 'images/categories_choice/entertainment.jpg',
                      text: 'Entertainment',
                    ),
                  ),),
                ],),Row(children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CategoryTile(
                      imgUrl: 'images/categories_choice/health.jpg',
                      text: 'Health',
                    ),
                  ),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(top:16,right:16,bottom: 16,left: 8),
                    child: CategoryTile(
                      imgUrl: 'images/categories_choice/science.jpg',
                      text: 'Science',
                    ),
                  ),),
                ],),



                // CategoryChoiceRow(
                //     imgPath1:'images/categories_choice/business1.jpg',
                //     imgPath2:'images/categories_choice/health.jpg',
                //     text1:'Business',
                //     text2:'Health'
                //
                // ), CategoryChoiceRow(
                //     imgPath1:'images/categories_choice/entertainment.jpg',
                //     imgPath2:'images/categories_choice/sports1.jpg',
                //     text1:'Entertainment',
                //     text2:'Sports'
                //
                // ),CategoryChoiceRow(
                //     imgPath1:'images/categories_choice/science.jpg',
                //     imgPath2:'images/categories_choice/technology.jpg',
                //     text1:'Science',
                //     text2:'Technology'
                //
                // ),


              ],),
            )),



          ],),
        ),
    );
  }
}



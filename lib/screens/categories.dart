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
                CategoryChoiceRow(
                    imgPath1:'images/categories_choice/business1.jpg',
                    imgPath2:'images/categories_choice/health.jpg',
                    text1:'Business',
                    text2:'Health'

                ), CategoryChoiceRow(
                    imgPath1:'images/categories_choice/entertainment.jpg',
                    imgPath2:'images/categories_choice/sports1.jpg',
                    text1:'Entertainment',
                    text2:'Sports'

                ),CategoryChoiceRow(
                    imgPath1:'images/categories_choice/science.jpg',
                    imgPath2:'images/categories_choice/technology.jpg',
                    text1:'Science',
                    text2:'Technology'

                ),


              ],),
            )),



          ],),
        ),
    );
  }
}



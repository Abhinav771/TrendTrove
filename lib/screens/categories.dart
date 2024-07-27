import 'package:flutter/material.dart';

import '../components/category_choice.dart';
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
          title:Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          centerTitle: true,
        ),
        body: Container(
          child: Column(children: [
            SizedBox(height: 30,),
            Expanded(child: SingleChildScrollView(
              child: Column(children: [
                Row(children: [
                Expanded(

                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0,top: 8,left: 16,bottom: 16),
                      child: CategoryChoice(
                        imgPath:'images/categories_choice/business1.jpg'
                      )
                    )
                ),Expanded(

                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0,top: 8,left: 8,bottom: 16),
                      child: CategoryChoice(
                        imgPath:'images/categories_choice/health.jpg'
                      )
                    )
                ),

              ],),

              ],),
            )),



          ],),
        ),
    );
  }
}


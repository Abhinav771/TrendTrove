import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/category_list.dart';

import '../bloc/category/category_bloc.dart';
import '../bloc/category/category_event.dart';
import '../bloc/category/category_state.dart';
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
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/categories_choice/science.jpg',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity),
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
                            onTap: () {
                              context.read<CategoryBloc>().add(SelectCategory('Business'));
                            },
                            child:BlocBuilder<CategoryBloc, CategoryState>(
                                  builder: (context, state) {
                                    if(state is CategoryFinal){

                                      bool a=state.fcat[0];
                                      print('Cat: '+a.toString());
                                      if(a){
                                        print('Cat: '+a.toString());
                                        return Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 80,),
                                              Row(children: [
                                                SizedBox(width: 60,),
                                                Icon(Icons.check,size: 50,color: Colors.white,),
                                              ],),


                                            ],),
                                        );
                                      }
                                      else{
                                        print('Cat: '+a.toString());
                                        return Container(
                                            alignment: Alignment.center,

                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 80,),
                                                Text('Business', style: TextStyle(fontSize: 25,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'LexendDeca'),),


                                              ],)
                                        );
                                      }
                                    }
                                    else{
                                      return Container(
                                          alignment: Alignment.center,

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 80,),
                                              Text('Business', style: TextStyle(fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'LexendDeca'),),


                                            ],)
                                      );
                                    }
  },
),


                          ),
                        ],
                      ),
                    ),
                  ),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(top:16,right:16,bottom: 16,left: 8),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/categories_choice/science.jpg',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity),
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
                            onTap: () {
                              context.read<CategoryBloc>().add(SelectCategory('Health'));
                            },
                            child:BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                if(state is CategoryFinal){

                                  bool a=state.fcat[2];
                                  print('CatHealth: '+a.toString());
                                  if(a){
                                    print('CatHealth: '+a.toString());
                                    return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Row(children: [
                                            SizedBox(width: 60,),
                                            Icon(Icons.check,size: 50,color: Colors.white,),
                                          ],),


                                        ],),
                                    );
                                  }
                                  else{
                                    print('CatHealth: '+a.toString());
                                    return Container(
                                        alignment: Alignment.center,

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 80,),
                                            Text('Health', style: TextStyle(fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'LexendDeca'),),


                                          ],)
                                    );
                                  }
                                }
                                else{
                                  return Container(
                                      alignment: Alignment.center,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Text('Health', style: TextStyle(fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LexendDeca'),),


                                        ],)
                                  );
                                }
                              },
                            ),


                          ),
                        ],
                      ),
                    ),
                  ),),
                ],),Row(children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/categories_choice/science.jpg',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity),
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
                            onTap: () {
                              context.read<CategoryBloc>().add(SelectCategory('Entertainment'));
                            },
                            child:BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                if(state is CategoryFinal){

                                  bool a=state.fcat[1];
                                  print('CatEnter: '+a.toString());
                                  if(a){
                                    print('CatEnter: '+a.toString());
                                    return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Row(children: [
                                            SizedBox(width: 60,),
                                            Icon(Icons.check,size: 50,color: Colors.white,),
                                          ],),


                                        ],),
                                    );
                                  }
                                  else{
                                    print('CatEnter: '+a.toString());
                                    return Container(
                                        alignment: Alignment.center,

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 80,),
                                            Text('Entertainment', style: TextStyle(fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'LexendDeca'),),


                                          ],)
                                    );
                                  }
                                }
                                else{
                                  return Container(
                                      alignment: Alignment.center,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Text('Entertainment', style: TextStyle(fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LexendDeca'),),


                                        ],)
                                  );
                                }
                              },
                            ),


                          ),
                        ],
                      ),
                    ),
                  ),),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(top:16,right:16,bottom: 16,left: 8),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/categories_choice/science.jpg',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity),
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
                            onTap: () {
                              context.read<CategoryBloc>().add(SelectCategory('Politics'));
                            },
                            child:BlocBuilder<CategoryBloc, CategoryState>(
                              builder: (context, state) {
                                if(state is CategoryFinal){

                                  bool a=state.fcat[3];
                                  print('CatPolitics: '+a.toString());
                                  if(a){
                                    print('CatPolitics: '+a.toString());
                                    return Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Row(children: [
                                            SizedBox(width: 60,),
                                            Icon(Icons.check,size: 50,color: Colors.white,),
                                          ],),


                                        ],),
                                    );
                                  }
                                  else{
                                    print('CatPolitics: '+a.toString());
                                    return Container(
                                        alignment: Alignment.center,

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 80,),
                                            Text('Politics', style: TextStyle(fontSize: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'LexendDeca'),),


                                          ],)
                                    );
                                  }
                                }
                                else{
                                  return Container(
                                      alignment: Alignment.center,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 80,),
                                          Text('Politics', style: TextStyle(fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'LexendDeca'),),


                                        ],)
                                  );
                                }
                              },
                            ),


                          ),
                        ],
                      ),
                    )
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



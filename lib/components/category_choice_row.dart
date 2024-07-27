import 'package:flutter/material.dart';

class CategoryChoiceRow extends StatefulWidget {
  final String imgPath1;
  final String imgPath2;
  final String text1;
  final String text2;

  const CategoryChoiceRow({super.key, required this.imgPath1, required this.imgPath2,  required this.text1, required this.text2});

  @override
  State<CategoryChoiceRow> createState() => _CategoryChoiceRowState();
}

class _CategoryChoiceRowState extends State<CategoryChoiceRow> {
  bool isSelected=true;

  // / isSelected==true?Text(widget.text1, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),):Icon(Icons.check),
  @override

  Widget build(BuildContext context) {
    Widget TopContainer =Text(widget.text1, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),);
    Widget TextContainer =Text(widget.text1, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),);
    Widget CheckContainer=Icon(Icons.check);
    return Row(children: [
      Expanded(

          child: Padding(
              padding: const EdgeInsets.only(right: 16.0,top: 8,left: 16,bottom: 16),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(widget.imgPath1,
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
                      if(isSelected==true){
                        TopContainer=CheckContainer;
                        isSelected=false;
                      }else{
                        TopContainer=TextContainer;
                        isSelected=true;

                      }
                      setState(() {

                      });

                    },
                    child: Container(
                        alignment: Alignment.center,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 80,),
                            TopContainer,



                          ],)
                    ),
                  ),
                ],
              ),
          )
      ),Expanded(

          child: Padding(
              padding: const EdgeInsets.only(right: 16.0,top: 8,left: 8,bottom: 16),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(widget.imgPath2,
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
                  Container(
                      alignment: Alignment.center,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 80,),
                          Text(widget.text2, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),

                        ],)
                  ),
                ],
              )
          )
      ),

    ],);
  }
}

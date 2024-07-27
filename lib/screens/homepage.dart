import 'package:flutter/material.dart';
import 'package:news_app/backend/function.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/drawer_Container.dart';
import '../components/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // TextEditingController get searchController=>_searchController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController _search =TextEditingController();


  List<List<String>> myList=[
    ['https://ichef.bbci.co.uk/news/1024/cpsprodpb/16e3/live/990724a0-48d9-11ef-9e1c-3b4a473456a6.jpg.webp','Text 1'],
    ['https://imgs.search.brave.com/9umfp4yLYQmAWJRlbsRv_Y54_1Qmsci9cPjsdCn8VVI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pY2hl/Zi5iYmNpLmNvLnVr/L25ld3MvMTAyNC9j/cHNwcm9kcGIvZTg0/MC9saXZlLzViNDAw/OWYwLTQxNzQtMTFl/Zi05ZTFjLTNiNGE0/NzM0NTZhNi5qcGc','Text 2'],
    ['https://imgs.search.brave.com/6aL-20vsXrDQojR7r8GyTa02aE3wt1WFa2D46wXqJFc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNjM2/ODAzMDIyL3Bob3Rv/L25ld3Mtb24tbGFw/dG9wLXNjcmVlbi5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/R2QwZWtuZVZuMS1O/Umdtay1nU0hvaExY/VWNsTUlmTzRvMi1s/d3hqZzBxQT0','Text 3'],
    // ['Img 4','Text 4'],
    // ['Img 5','Text 5'],
  ];
  int _currentPage=0;
  late Future<List> news;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   news=fetchNews();
  // }
  static final TextEditingController _searchController =TextEditingController(text:'');

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        child:DrawerContainer(),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Image.asset('images/icons/dark_theme.png',height: 30,width: 30,),
          ),Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Categories()));
                },
                child: Image.asset('images/icons/category_icon.png',height: 25,width: 25,)),
          ),

        ],
        title:Text('TrendTrivo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,fontFamily: 'LexendDeca'),),
        centerTitle: true,
      ),
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),

          Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Center(
                    child: Container(

                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color:Color(0XFFC3C3C3),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 4),
                            child: Icon(Icons.search,size: 30,color:Colors.white),
                          ),
                          Container(
                            // color: Colors.red,
                            // height: 40,
                            width: 210,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _searchController,
                              decoration: InputDecoration(

                                    hintText: 'Search',
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'LexendDeca'


                                        ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none, // No border line
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none, // No border line when enabled
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none, // No border line when focused
                                ),


                                  ),


                                  onChanged: (text){
                                    print('Text: '+text);
                                  }
                            ),
                          )
                          // TextField(
                          //   controller: _searchController,
                          //   decoration: InputDecoration(
                          //     labelText: 'Search',
                          //
                          //   ),
                          //   onChanged: (text){
                          //
                          //   },
                          // ),

                        ],),
                    ),


                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,top: 16),
                        child: Text('Breaking News', style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,fontFamily: 'LexendDeca')),
                      ),
                    ],
                  ),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          onPageChanged: (value,_){
                            setState(() {
                              _currentPage=value;
                            });
                          }
                        // autoPlayInterval: Duration(seconds: 2),
                      ),
                      items:
                      [0,1,2].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network('${myList[i][0]}',fit: BoxFit.cover,width: double.infinity,height: double.infinity,)
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      // Adjust opacity here
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Positioned(
                                        bottom:30,
                                        left:30,
                                        child: Text('${myList[i][1]}',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'LexendDeca'),)
                                    ),
                                  ],)


                            );
                          },
                        );
                      }).toList(),

                    ),

                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int i=0;i<myList.length;i++)
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 8,
                            width: i==_currentPage? 17:8,
                            decoration: BoxDecoration(
                              color: i==_currentPage?blueColor:Colors.grey,
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                      ],),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,top: 16),
                        child: Text('Recomendation', style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,fontFamily: 'LexendDeca')),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(children: [
                      NewsTile(
                        newsImg: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/16e3/live/990724a0-48d9-11ef-9e1c-3b4a473456a6.jpg.webp',
                        headline: 'Donald Trump attempted by shooter in election rally.',
                        category: 'Politics',
                      ),NewsTile(
                        newsImg: 'https://edition.cnn.com/politics/live-news/harris-trump-election-07-25-24/index.html',
                        headline: 'Headline 1',
                        category: 'Politics',
                      ),NewsTile(
                        newsImg: 'https://imgs.search.brave.com/Y1xE7IKZNOAEmEUkEwRQLh_nu857vRtGNLu0KEFnQX4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/a2V0ay5jb20vd3At/Y29udGVudC91cGxv/YWRzL3NpdGVzLzM0/LzIwMjQvMDcvR2V0/dHlJbWFnZXMtMjE2/MTkyNTUzNC5qcGc_/dz05MDA',
                        headline: 'Headline 1',
                        category: 'Politics',
                      ),NewsTile(
                        newsImg: 'https://imgs.search.brave.com/Y1xE7IKZNOAEmEUkEwRQLh_nu857vRtGNLu0KEFnQX4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/a2V0ay5jb20vd3At/Y29udGVudC91cGxv/YWRzL3NpdGVzLzM0/LzIwMjQvMDcvR2V0/dHlJbWFnZXMtMjE2/MTkyNTUzNC5qcGc_/dz05MDA',
                        headline: 'Headline 1',
                        category: 'Politics',
                      ),
                    ],),
                  ),

                ],),
              ),
          ),

      ],)

    );
  }
}



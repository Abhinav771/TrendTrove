import 'package:flutter/material.dart';
import 'package:news_app/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController _search =TextEditingController();


  List<List<String>> myList=[
    ['https://imgs.search.brave.com/7huC7LC_hiat34QEO_pK_I5N8MZD0gwl7ovhkUYncFs/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTMz/OTQ2NjY2Ni92ZWN0/b3IvYnJlYWtpbmct/bmV3cy5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9bWl1VmhO/OTFkSk5DNXhvbndR/clNuZERUbEZHZEdy/WXo4NjZNNDIyY21C/UT0','Text 1'],
    ['https://imgs.search.brave.com/9umfp4yLYQmAWJRlbsRv_Y54_1Qmsci9cPjsdCn8VVI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pY2hl/Zi5iYmNpLmNvLnVr/L25ld3MvMTAyNC9j/cHNwcm9kcGIvZTg0/MC9saXZlLzViNDAw/OWYwLTQxNzQtMTFl/Zi05ZTFjLTNiNGE0/NzM0NTZhNi5qcGc','Text 2'],
    ['https://imgs.search.brave.com/6aL-20vsXrDQojR7r8GyTa02aE3wt1WFa2D46wXqJFc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNjM2/ODAzMDIyL3Bob3Rv/L25ld3Mtb24tbGFw/dG9wLXNjcmVlbi5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/R2QwZWtuZVZuMS1O/Umdtay1nU0hvaExY/VWNsTUlmTzRvMi1s/d3hqZzBxQT0','Text 3'],
    // ['Img 4','Text 4'],
    // ['Img 5','Text 5'],
  ];
  int _currentPage=0;
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.menu),
          onPressed: () {  },
        ),
        title:Text('TrendTrivo'),
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
                            padding: const EdgeInsets.only(left: 16.0,right: 48),
                            child: Icon(Icons.search,size: 30,color:Colors.white),
                          ),
                          Text('Search',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),),
                        ],),
                    ),


                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,top: 16),
                        child: Text('Breaking News', style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
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
                                          child: Image.network('${myList[i][0]}',fit: BoxFit.cover,width: double.infinity,)
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
                                        child: Text('${myList[i][1]}',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),)
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
                        child: Text('Recomendation', style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(children: [
                      NewsTile(
                        newsImg: 'https://imgs.search.brave.com/Gk0koot5aaVLGaqqRrhxaKZALCjUwWU4i2SV8d-Xkog/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTIw/NTk5NTk5Ny9waG90/by9icmVha2luZy1u/ZXdzLXJlcG9ydGVy/cy1yZXBvcnRpbmct/b24tY29yb25hdmly/dXMtZnJvbS1jaGlu/YS5qcGc_cz02MTJ4/NjEyJnc9MCZrPTIw/JmM9WDhvSGFfcVdY/VnJ2WFltVHBhaWhk/SHdMNHo5RjBmNGZl/MC00aTNXem1lQT0',
                        headline: 'Donald Trump attempted by shooter in election rally.',
                        category: 'Politics',
                      ),NewsTile(
                        newsImg: 'https://imgs.search.brave.com/Y1xE7IKZNOAEmEUkEwRQLh_nu857vRtGNLu0KEFnQX4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/a2V0ay5jb20vd3At/Y29udGVudC91cGxv/YWRzL3NpdGVzLzM0/LzIwMjQvMDcvR2V0/dHlJbWFnZXMtMjE2/MTkyNTUzNC5qcGc_/dz05MDA',
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


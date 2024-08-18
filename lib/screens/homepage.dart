import 'dart:convert';
// backgroundColor: Color(0XFFEBEBEB),
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider; // Use alias to avoid conflicts
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/backend/function.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/utilities/constants.dart';


import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';
import '../bloc/theme/theme_state.dart';
import '../components/drawer_Container.dart';
import '../components/news_tile.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';
import '../utils/enums.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // TextEditingController get searchController=>_searchController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController _search =TextEditingController();


  List<List<String>> myList = [
    [
      'https://ichef.bbci.co.uk/news/1024/cpsprodpb/16e3/live/990724a0-48d9-11ef-9e1c-3b4a473456a6.jpg.webp',
      'Text 1'
    ],
    [
      'https://imgs.search.brave.com/9umfp4yLYQmAWJRlbsRv_Y54_1Qmsci9cPjsdCn8VVI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pY2hl/Zi5iYmNpLmNvLnVr/L25ld3MvMTAyNC9j/cHNwcm9kcGIvZTg0/MC9saXZlLzViNDAw/OWYwLTQxNzQtMTFl/Zi05ZTFjLTNiNGE0/NzM0NTZhNi5qcGc',
      'Text 2'
    ],
    [
      'https://imgs.search.brave.com/6aL-20vsXrDQojR7r8GyTa02aE3wt1WFa2D46wXqJFc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNjM2/ODAzMDIyL3Bob3Rv/L25ld3Mtb24tbGFw/dG9wLXNjcmVlbi5q/cGc_cz02MTJ4NjEy/Jnc9MCZrPTIwJmM9/R2QwZWtuZVZuMS1O/Umdtay1nU0hvaExY/VWNsTUlmTzRvMi1s/d3hqZzBxQT0',
      'Text 3'
    ],
    // ['Img 4','Text 4'],
    // ['Img 5','Text 5'],
  ];
  int _currentPage = 0;
  late Future<List> news;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   news=fetchNews();
  // }
  static final TextEditingController _searchController = TextEditingController(
      text: '');


  // Future<NewsModel> getNewsApi() async {
  //   final response = await http.get(Uri.parse(
  //       'https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return NewsModel.fromJson(data);
  //   }
  //   else {
  //     return NewsModel.fromJson(data);
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }





  late List<dynamic> users;
  void fetchUsers() async{
    try{
      print('fetchUser called!');
      final response = await http.get(Uri.parse('https://newsdata.io/api/1/latest?apikey=pub_500844253ca6f4c7ec6abaa4a4644b0b684d9&language=en'));
      final body=response.body;
      final json=jsonDecode(body);
      setState(() {
        users=json['results'];
      });
      print('Fetched Completed!');
    }catch(e){
      print(e);
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerContainer(),
      ),
      appBar: AppBar(


        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if(state is LightTheme){
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                    onTap: (){
                      context.read<ThemeBloc>().add(ToggleTheme());
                    },
                    child:Icon(Icons.brightness_2_sharp,size:25)
                  // Image.asset(
                  //     'images/icons/dark_theme.png', height: 30, width: 30),
                ),
              );
            }
            else{
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                    onTap: (){
                      context.read<ThemeBloc>().add(ToggleTheme());
                    },
                    child:Icon(Icons.sunny,size:25)
                  // Image.asset(
                  //     'images/icons/dark_theme.png', height: 30, width: 30),
                ),
              );
            }

  },
),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              },
              child: Icon(Icons.category,size:30),
              // Image.asset(
              //     'images/icons/category_icon.png', height: 25, width: 25),
            ),
          ),
        ],
        title: Text(
          'Newsly',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,

      ),
      // backgroundColor: Color(0XFFF5F5F5),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Expanded(
          //   child: BlocBuilder<NewsBloc, NewsState>(
          //     builder: (context, state) {
          //       if (state is NewsLoadingState) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (state is NewsLoadedState) {
          //         List<NewsModel> newsLL = state.newsList;
          //         return ListView.builder(
          //           itemCount: newsLL.length, // Use length of the news list
          //           itemBuilder: (context, index) {
          //             final newsItem = newsLL[index];
          //             return ListTile(
          //               title: Text(newsItem.title ?? 'No Title'),
          //               subtitle: Text(newsItem.description ?? 'No Description'),
          //               leading: newsItem.imageUrl != null ? Image.network(newsItem.imageUrl!) : null,
          //             );
          //           },
          //         );
          //       } else if (state is NewsErrorState) {
          //         return Center(child: Text(state.error));
          //       } else {
          //         return Center(child: Text('Error!'));
          //       }
          //     },
          //   ),
          // ),

          Expanded(

            child: Column(
              children: [




                Center(
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0XFFD6D6D6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 4),
                          child: Icon(
                              Icons.search, size: 30, color: Colors.white),
                        ),
                        Container(
                          width: 210,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LexendDeca',
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (text) {
                              print('Text: ' + text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text('Top News', style: Theme.of(context).textTheme.titleLarge,)
                    ),
                  ],
                ),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if(state is NewsLoadingState){
                      return CircularProgressIndicator();
                    }
                    else if(state is NewsLoadedState){
                      List<NewsModel> newsLL = state.newsList;
                      return Container(
                        child: carousel_slider.CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0,
                            autoPlay: true,
                            onPageChanged: (value, _) {
                              setState(() {
                                _currentPage = value;
                              });
                            },
                          ),
                          items: [0, 1, 2, 3, 4].map((i) {
                            final newsItem = newsLL[i];
                            return Builder(
                              builder: (BuildContext context) {
                                return GestureDetector(
                                  onTap: (){

                                      showModalBottomSheet(
                                        enableDrag: true,
                                        context: context,
                                        builder: (BuildContext context) {

                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerRight, // Position child at the bottom-right corner
                                                color: Theme.of(context).primaryColor,
                                                width: double.infinity,
                                                height: 40,
                                                child: Icon(Icons.bookmark_border,size: 30,color: Theme.of(context).secondaryHeaderColor,),
                                              ),
                                              // Image.network(newsImg,height: 300,width: double.infinity,),
                                              Container(
                                                color: Theme.of(context).primaryColor,
                                                // height: 400,
                                                child: Center(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ),
                                              ),
                                            ],

                                          );
                                        },
                                      );
                                  },
                                  child: Container(
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
                                            child: Image.network(
                                              newsItem.imageUrl != null ? newsItem.imageUrl.toString() : '',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 30,
                                          left: 30,
                                          right: 30, // Added to ensure the text can wrap within bounds
                                          child: Text(
                                            newsItem.title ?? 'No Title',
                                            style: Theme.of(context).textTheme.titleSmall,
                                            overflow:  TextOverflow.ellipsis, // Allows text to wrap
                                            maxLines: 2,
                                            softWrap: true, // Ensures text wraps to the next line
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                              },
                            );
                          }).toList(),
                        ),
                      );

                    }
                    else{
                      return Text('Error');
                    }


                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 8,
                          width: i == _currentPage ? 17 : 8,
                          decoration: BoxDecoration(
                            color: i == _currentPage ? blueColor : Colors
                                .grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text('Recommendation', style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      if (state is NewsLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is NewsLoadedState) {
                        List<NewsModel> newsLL = state.newsList;
                        return ListView.builder(
                          itemCount: newsLL.length, // Use length of the news list
                          itemBuilder: (context, index) {
                            final newsItem = newsLL[index];
                            // return ListTile(
                            //   title: Text(newsItem.title ?? 'No Title'),
                            //   subtitle: Text(newsItem.description ?? 'No Description'),
                            //   leading: newsItem.imageUrl != null ? Image.network(newsItem.imageUrl!) : null,
                            // );
                            return NewsTile(
                                newsImg: newsItem.imageUrl != null ? newsItem.imageUrl!.toString() : null.toString(),
                                headline: newsItem.title.toString(),
                                category: newsItem.category![0].toString());
                          },
                        );
                      } else if (state is NewsErrorState) {
                        return Center(child: Text(state.error));
                      } else {
                        return Center(child: Text('Error!'));
                      }
                    },
                  ),
                ),
                // Container(
                //   child: Column(
                //     children: [
                //       NewsTile(
                //         newsImg: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/16e3/live/990724a0-48d9-11ef-9e1c-3b4a473456a6.jpg.webp',
                //         headline: 'Donald Trump attempted by shooter in election rally.',
                //         category: 'Politics',
                //       ),
                //       NewsTile(
                //         newsImg: 'https://edition.cnn.com/politics/live-news/harris-trump-election-07-25-24/index.html',
                //         headline: 'Headline 1',
                //         category: 'Politics',
                //       ),
                //       NewsTile(
                //         newsImg: 'https://imgs.search.brave.com/Y1xE7IKZNOAEmEUkEwRQLh_nu857vRtGNLu0KEFnQX4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/a2V0ay5jb20vd3At/Y29udGVudC91cGxv/YWRzL3NpdGVzLzM0/LzIwMjQvMDcvR2V0/dHlJbWFnZXMtMjE2/MTkyNTUzNC5qcGc_/dz05MDA',
                //         headline: 'Headline 1',
                //         category: 'Politics',
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



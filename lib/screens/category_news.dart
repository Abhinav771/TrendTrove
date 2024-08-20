import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category_api/category_api_bloc.dart';

import '../bloc/category_api/category_api_state.dart';
import '../components/news_tile.dart';
import '../model/news_model.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category News', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Expanded(
            child: BlocBuilder<CategoryApiBloc, CategoryApiState>(
              builder: (context, state) {
                if (state is CategoryNewsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is CategoryNewsLoadedState) {
                  print('News Loaded');
                  List<NewsModel> newsList = state.newsList;
                  print('First '+newsList[0].country.toString());
                  if (newsList.isEmpty) {
                    return Center(child: Text('No results found.'));
                  }
                  return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      final newsItem = newsList[index];
                      return NewsTile(
                        newsImg: newsItem.imageUrl ?? '',
                        headline: newsItem.title ?? '',
                        category: newsItem.category?.isNotEmpty == true ? newsItem.category![0] : '',
                        description: newsItem.description ?? '',
                        sourceIcon: newsItem.sourceIcon ?? '',
                        sourceName: newsItem.sourceName ?? '',
                        articleId: newsItem.articleId ?? '',
                      );
                    },
                  );
                } else if (state is CategoryNewsErrorState) {
                  return Center(child: Text(state.error));
                } else {
                  return Center(child: Text('Unexpected error!'));
                }
              },
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search/search_bloc.dart';
import '../bloc/search/search_state.dart';
import '../components/news_tile.dart';
import '../model/news_model.dart';

class SearchPage extends StatefulWidget {
  final String searchResult;
  SearchPage({required this.searchResult});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchPage', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Showing Results for: ${widget.searchResult}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchNewsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SearchNewsLoadedState) {
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
                      );
                    },
                  );
                } else if (state is SearchNewsErrorState) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Theme/theme.dart';
import 'package:news_app/bloc/bookmark/bookmark_bloc.dart';
import 'package:news_app/bloc/category/category_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/search/search_bloc.dart';
import 'package:news_app/bloc/theme/theme_bloc.dart';
import 'package:news_app/bloc/theme/theme_state.dart';
import 'package:news_app/repository/category_repo.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/repository/search_repo.dart';
import 'package:news_app/repository/top_news.dart';
import 'package:news_app/screens/homepage.dart';

import 'bloc/category_api/category_api_bloc.dart';
import 'bloc/news_event.dart';
import 'bloc/top_news/top_news_bloc.dart';
import 'bloc/top_news/top_news_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<NewsRepository>(
          create: (context) => NewsRepository(),
        ),
        RepositoryProvider<TopNewsRepository>(
          create: (context) => TopNewsRepository(),
        ),
        RepositoryProvider<SearchRepo>(
          create: (context) => SearchRepo(),
        ),
        RepositoryProvider<CategoryRepo>(
          create: (context) => CategoryRepo(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
            RepositoryProvider.of<NewsRepository>(context),
          )..add(LoadNews()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(
            RepositoryProvider.of<SearchRepo>(context),
          ),
        ),
        BlocProvider<CategoryApiBloc>(
          create: (context) => CategoryApiBloc(
            RepositoryProvider.of<CategoryRepo>(context),
          ),
        ),
        BlocProvider(
          create: (context) => TopNewsBloc(TopNewsRepository())..add(TopLoadNews()),
          child: HomePage(),
        ),
        BlocProvider(
            create: (context) => BookmarkBloc(),
        ),

      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state is LightTheme ? lightTheme : darkTheme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

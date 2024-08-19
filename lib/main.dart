import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Theme/theme.dart';
import 'package:news_app/bloc/category/category_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/search/search_bloc.dart';
import 'package:news_app/bloc/theme/theme_bloc.dart';
import 'package:news_app/bloc/theme/theme_state.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/repository/search_repo.dart';
import 'package:news_app/screens/homepage.dart';

import 'bloc/news_event.dart';

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
        RepositoryProvider<SearchRepo>(
          create: (context) => SearchRepo(),
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

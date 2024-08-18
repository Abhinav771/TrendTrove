import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Theme/theme.dart';
import 'package:news_app/bloc/category/category_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/screens/homepage.dart';
import 'package:news_app/utilities/constants.dart';

import 'bloc/news_bloc.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(),
      child: BlocProvider(
        create: (context) =>
        NewsBloc(
          RepositoryProvider.of<NewsRepository>(context),
        )
          ..add(LoadNews()),
        child: BlocProvider(
          create: (context) => CategoryBloc(),
          child: BlocProvider(
            create: (context) => ThemeBloc(),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                if(state is LightTheme){
                  return MaterialApp(
                    theme: lightTheme,
                    home: HomePage(),
                  );
                }
                else{
                  return MaterialApp(
                    theme: darkTheme,
                    home: HomePage(),
                  );
                }

              },
            ),
          ),
        ),
      ),
    );
  }
}

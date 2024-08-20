import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/bloc/top_news/top_news_event.dart';
import 'package:news_app/bloc/top_news/top_news_state.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/model/news_model.dart';

import '../../repository/top_news.dart';

class TopNewsBloc extends Bloc<TopNewsEvent, TopNewsState> {
  final TopNewsRepository topNewsRepository;

  TopNewsBloc(this.topNewsRepository) : super(TopNewsLoadingState()) {
    on<TopLoadNews>((event, emit) async {
      emit(TopNewsLoadingState());
      try {
        final newsList = await topNewsRepository.getNews();
        emit(TopNewsLoadedState(newsList));
      } catch (e) {
        emit(TopNewsErrorState(e.toString()));
      }
    });
  }

}

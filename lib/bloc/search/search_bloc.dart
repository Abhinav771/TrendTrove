import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/search/search_event.dart';
import 'package:news_app/bloc/search/search_state.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/search_repo.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;

  SearchBloc(this.searchRepo) : super(SearchNewsLoadingState()) {
    on<SearchLoadNews>((event, emit) async {
      emit(SearchNewsLoadingState());
      try {
        final newsList = await searchRepo.getNews(query: event.query);
        emit(SearchNewsLoadedState(newsList));
      } catch (e) {
        emit(SearchNewsErrorState(e.toString()));
      }
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/model/news_model.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoadingState()) {
    on<LoadNews>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final newsList = await newsRepository.getNews();
        emit(NewsLoadedState(newsList));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });

    on<LoadMoreNews>((event, emit) async {
      // Emit loading state only if the current state is NewsLoadedState
      if (state is NewsLoadedState) {
        // Cast the state to NewsLoadedState
        final currentState = state as NewsLoadedState;

        // Prevent emitting another loading state if already in loading state
        if (currentState.isLoadingMore) return;

        try {
          // Emit NewsLoadingState to indicate loading more news
          emit(NewsLoadedState(currentState.newsList, isLoadingMore: true));

          // Fetch additional news
          final newsList = await newsRepository.getNews(page: newsRepository.nextPage);

          // Update the list with new news
          final updatedNewsList = List<NewsModel>.from(currentState.newsList)..addAll(newsList);

          // Emit NewsLoadedState with the updated news list
          emit(NewsLoadedState(updatedNewsList));
        } catch (e) {
          // Emit NewsErrorState in case of an error
          emit(NewsErrorState(e.toString()));
        }
      } else {
        print("Unexpected state: ${state.runtimeType}");
      }
    });
  }
}

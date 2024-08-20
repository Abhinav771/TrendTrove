import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category_api/category_api_event.dart';
import 'package:news_app/bloc/category_api/category_api_state.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repository/category_repo.dart';

class CategoryApiBloc extends Bloc<CategoryApiEvent, CategoryApiState> {
  final CategoryRepo categoryRepo;

  CategoryApiBloc(this.categoryRepo) : super(CategoryNewsLoadingState()) {
    on<CategoryLoadNews>((event, emit) async {
      emit(CategoryNewsLoadingState());

      try {
        final newsList = await categoryRepo.getNews(categories: event.cat);
        emit(CategoryNewsLoadedState(newsList));
      } catch (e) {
        emit(CategoryNewsErrorState(e.toString()));
      }
    });
  }
}

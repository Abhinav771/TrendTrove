


import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/utils/enums.dart';

import '../model/news_model.dart';
class NewsBloc extends Bloc<NewsEvent,NewsState>{
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository):super(NewsLoadingState()){
    on<LoadNews>((event,emit)async{
      emit(NewsLoadingState());
      try{
        final newsL=await newsRepository.getNews();
        emit(NewsLoadedState(newsL));
        
      }catch(e){
        emit(NewsErrorState(e.toString()));
      }
    });

  }

}
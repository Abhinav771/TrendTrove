

import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class NewsState extends Equatable{

}

class NewsLoadingState extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class NewsLoadedState extends NewsState{
  NewsLoadedState(this.newsList);
  final List<NewsModel> newsList;

  @override
  // TODO: implement props
  List<Object?> get props =>[newsList];

}
class NewsErrorState extends NewsState{
  NewsErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props =>[error];

}


class NewsCategories extends NewsState{
  NewsCategories(this.cat);
  List<String> cat;

  @override
  // TODO: implement props
  List<Object?> get props => [cat];

}
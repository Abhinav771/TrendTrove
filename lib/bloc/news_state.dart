

import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class NewsState extends Equatable{

}

class NewsLoadingState extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class NewsLoadedState extends NewsState {
  final List<NewsModel> newsList;
  final bool isLoadingMore;

  NewsLoadedState(this.newsList, {this.isLoadingMore = false});

  @override
  List<Object?> get props => [newsList, isLoadingMore];
}
class NewsErrorState extends NewsState{
  NewsErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props =>[error];

}


// class NewsCategories extends NewsState{
//   NewsCategories(this.cat);
//   List<dynamic> cat=[{
//     'business':false,
//     'entertainment':false,
//     'health':false,
//     'science':false,
//   }];
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cat];
//
// }
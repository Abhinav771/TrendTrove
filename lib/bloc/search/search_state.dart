

import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class SearchState extends Equatable{

}

class SearchNewsLoadingState extends SearchState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class SearchNewsLoadedState extends SearchState {
  final List<NewsModel> newsList;
  final bool isLoadingMore;

  SearchNewsLoadedState(this.newsList, {this.isLoadingMore = false});

  @override
  List<Object?> get props => [newsList, isLoadingMore];
}
class SearchNewsErrorState extends SearchState{
  SearchNewsErrorState(this.error);
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
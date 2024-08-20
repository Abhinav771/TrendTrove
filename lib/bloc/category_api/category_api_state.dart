

import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class CategoryApiState extends Equatable{

}

class CategoryNewsLoadingState extends CategoryApiState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class CategoryNewsLoadedState extends CategoryApiState {
  final List<NewsModel> newsList;
  final bool isLoadingMore;

  CategoryNewsLoadedState(this.newsList, {this.isLoadingMore = false});

  @override
  List<Object?> get props => [newsList, isLoadingMore];
}
class CategoryNewsErrorState extends CategoryApiState{
  CategoryNewsErrorState(this.error);
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
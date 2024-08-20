import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';

abstract class TopNewsState extends Equatable{

}

class TopNewsLoadingState extends TopNewsState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}

class TopNewsLoadedState extends TopNewsState {
  final List<NewsModel> newsList;
  final bool isLoadingMore;

  TopNewsLoadedState(this.newsList, {this.isLoadingMore = false});

  @override
  List<Object?> get props => [newsList, isLoadingMore];
}
class TopNewsErrorState extends TopNewsState{
  TopNewsErrorState(this.error);
  final String error;

  @override
  // TODO: implement props
  List<Object?> get props =>[error];

}

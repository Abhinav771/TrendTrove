
import 'package:equatable/equatable.dart';
abstract class SearchEvent extends Equatable{

  const SearchEvent();
}

class SearchLoadNews extends SearchEvent {
  final String query;

  SearchLoadNews(this.query);

  @override
  List<Object?> get props => [query];
}


class SearchLoadMoreNews extends SearchEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



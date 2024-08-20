
import 'package:equatable/equatable.dart';
abstract class CategoryApiEvent extends Equatable{

  const CategoryApiEvent();
}

class CategoryLoadNews extends CategoryApiEvent {
  final String cat;

  CategoryLoadNews(this.cat);

  @override
  List<Object?> get props => [cat];
}


class SearchLoadMoreNews extends CategoryApiEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



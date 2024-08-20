import 'package:equatable/equatable.dart';
import 'package:news_app/components/news_tile.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  List<NewsTile> get bookmarkList => [];
  Map<String, bool> get bookmarkMap => {};

  @override
  List<Object?> get props => [];
}

class InitialBookmarkState extends BookmarkState {
  const InitialBookmarkState();

  @override
  List<Object?> get props => [];
}

class FinalBookmarkState extends BookmarkState {
  const FinalBookmarkState(this.bookmarkList, this.bookmarkMap);

  final List<NewsTile> bookmarkList;
  final Map<String, bool> bookmarkMap;

  @override
  List<Object?> get props => [bookmarkList, bookmarkMap];
}
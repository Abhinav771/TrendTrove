import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/news_tile.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(InitialBookmarkState()) {
    on<AddBookmark>((event, emit) {
      final List<NewsTile> x = List.from(state.bookmarkList);
      final Map<String, bool> y = Map.from(state.bookmarkMap);

      x.add(NewsTile(
        newsImg: event.newsImg,
        headline: event.headline,
        category: event.category,
        description: event.description,
        sourceName: event.sourceName,
        sourceIcon: event.sourceIcon,
        articleId: event.articleId,
      ));

      y[event.articleId] = true;
      emit(FinalBookmarkState(x, y));
    });

    on<RemoveBookmark>((event, emit) {
      final List<NewsTile> x = List.from(state.bookmarkList);
      final Map<String, bool> y = Map.from(state.bookmarkMap);

      x.removeWhere((item) => item.articleId == event.articleId);
      y.remove(event.articleId);
      emit(FinalBookmarkState(x, y));
    });
  }
}




import 'package:equatable/equatable.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object?> get props => [];
}

class AddBookmark extends BookmarkEvent {
  const AddBookmark({
    required this.sourceName,
    required this.sourceIcon,
    required this.description,
    required this.category,
    required this.newsImg,
    required this.headline,
    required this.articleId,
  });

  final String articleId;
  final String newsImg;
  final String headline;
  final String category;
  final String description;
  final String sourceName;
  final String sourceIcon;

  @override
  List<Object?> get props => [
    articleId,
    newsImg,
    headline,
    category,
    description,
    sourceName,
    sourceIcon,
  ];
}

class RemoveBookmark extends BookmarkEvent {
  const RemoveBookmark({required this.articleId});

  final String articleId;

  @override
  List<Object?> get props => [articleId];
}

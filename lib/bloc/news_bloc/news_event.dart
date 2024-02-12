part of 'news_bloc.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();

  @override
  List<Object> get props => [];
}

class FetchFeaturedArticles extends NewsEvents {
  final bool? isMarked;

  const FetchFeaturedArticles({this.isMarked});
}

class GetArticle extends NewsEvents {
  final int id;

  const GetArticle({required this.id});

  @override
  List<Object> get props => [id];
}

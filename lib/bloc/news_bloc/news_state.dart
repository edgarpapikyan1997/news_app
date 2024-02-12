part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class FeatureNewsLoaded extends NewsState {
  final List<Article>? articles;
  final bool? isMarked;

  const FeatureNewsLoaded({
    this.articles,
    this.isMarked,
  });

  FeatureNewsLoaded copyWith({
    List<Article>? articles,
    bool? isMarked,
  }) {
    return FeatureNewsLoaded(
      articles: articles ?? this.articles,
      isMarked: isMarked ?? this.isMarked,
    );
  }
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}

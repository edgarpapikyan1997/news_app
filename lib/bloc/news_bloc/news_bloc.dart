import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/news/abstract_news_repository.dart';
import '../../repositories/news/mock_news_repository.dart';
import '../../repositories/news/models/article.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  final AbstractNewsRepository newsRepository = MockNewsRepository();

  NewsBloc() : super(NewsInitial()) {
    on<FetchFeaturedArticles>(_mapGetFeatureNews);
  }



  void _mapGetFeatureNews(
      FetchFeaturedArticles event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      await Future.delayed(const Duration(seconds: 5));
      final articles = await newsRepository.getFeaturedArticles();
      print(articles);
      if(event.isMarked != null)
      {
        emit(const FeatureNewsLoaded().copyWith(articles: articles, isMarked: event.isMarked));
      }else {
        emit(const FeatureNewsLoaded().copyWith(articles: articles));
      }
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(NewsError('Something when wrong! Featured news in unavailable.'));
    }
  }
}

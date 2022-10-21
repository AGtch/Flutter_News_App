import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/articles_news_model/news_articles_model.dart';
import '../../../data/repository/news_articles_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final NewsArticlesRepository newsArticlesRepository;

  SearchCubit({required this.newsArticlesRepository}) : super(SearchInitial());

  void getArticlesFromSearching({required String searchedNews}) {
    emit(SearchLoadingState());

    newsArticlesRepository
        .searchForNews(searchedNews: searchedNews)
        .then((articlesResultOfSearch) {
      emit(FoundArticlesSuccessState(
          articlesResultSearch: articlesResultOfSearch));
    });
  }
}

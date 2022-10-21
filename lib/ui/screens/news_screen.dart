import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_news/data/services/local_source/shared_preferences_utils.dart';
import 'package:flutter_news/injection.dart';
import 'package:flutter_news/logic/cubit/data_cubit/articles_cubit.dart';
import 'package:flutter_news/ui/widgets/shared_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/articles_news_model/news_articles_model.dart';
import '../widgets/category_news_widget.dart';

class NewsScreen extends StatefulWidget {
  final ArticlesCubit cubit;

  const NewsScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  static dynamic indexCategorySelected = 0;
  final ScrollController _scrollController = ScrollController();
  List<NewsArticles> articles = [];
  List<NewsArticles> oldNewsArticles = [];
  bool isLoading = false;
  String country =
      getIt.get<SharedPreferencesUtils>().getCountry('country') ?? 'us';
  bool isConnected = true;
  bool changeCategory = false;

  @override
  void initState() {
    super.initState();
    ArticlesCubit.page = 1;
    BlocProvider.of<ArticlesCubit>(context);

    fetchData(
        country: country,
        category: newsCategories[indexCategorySelected].categoryName);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void fetchData({
    required String country,
    required String category,
  }) {
    widget.cubit.getNewsArticles(
      category: category,
      country: country,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    ScreenUtil.init(context);

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          setState(() {
            fetchData(
                country: country,
                category: newsCategories[indexCategorySelected].categoryName);
          });
        }
      }
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // mainAxisSize: MainAxisSize.min,
        children: [
          WidgetCategoryNews(
            listCategories: newsCategories,
            indexDefaultSelected: indexCategorySelected,
            onTab: (index) {
              setState(() {
                indexCategorySelected = index;
                _scrollController.position
                    .jumpTo(_scrollController.initialScrollOffset);
                ArticlesCubit.page = 1;
                String category = newsCategories[indexCategorySelected]
                    .categoryName
                    .toLowerCase();
                fetchData(
                  country: country,
                  category: category,
                );
              });
              return indexCategorySelected;
            },
          ),
          Flexible(
            child: handleInternetWidget(
                buildBlocWidget:
                    buildBlocWidget(scrollController: _scrollController),
                isConnected: isConnected),
          ),
        ],
      ),
    );
  }

  Widget buildBlocWidget({required ScrollController scrollController}) {
    return BlocConsumer<ArticlesCubit, ArticlesState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if (state is ArticlesLoadingState && state.isFirstFetch) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedArticlesSuccess) {
          FlutterNativeSplash.remove();

          articles = state.newsArticles;
          return createListView(
              newsArticles: articles, scrollController: scrollController);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

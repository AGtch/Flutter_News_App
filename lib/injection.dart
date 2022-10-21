import 'package:flutter_news/constants/themes/colors.dart';
import 'package:flutter_news/data/repository/news_articles_repository.dart';
import 'package:flutter_news/data/services/remote_source/api_service.dart';
import 'package:flutter_news/data/services/remote_source/dio.dart';
import 'package:flutter_news/logic/cubit/search_cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/services/local_source/shared_preferences_utils.dart';
import 'logic/cubit/data_cubit/articles_cubit.dart';
import 'logic/cubit/navigation_cubit/bottom_navigation_cubit.dart';
import 'logic/cubit/settings cubit/settings_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton(ColorsApp());
  getIt.registerSingleton<DioInit>(DioInit());
  getIt.registerSingleton<SharedPreferences>(sharedPref);
  getIt.registerSingleton<SharedPreferencesUtils>(SharedPreferencesUtils());
  getIt.registerSingleton<ApiService>(
    ApiService(dio: getIt()),
  );
  getIt.registerFactory<NewsArticlesRepository>(
      () => NewsArticlesRepository(apiService: getIt()));
  getIt.registerFactory<ArticlesCubit>(
      () => ArticlesCubit(newsArticlesRepository: getIt()));
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      newsArticlesRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SettingsCubit>(
      () => SettingsCubit(sharedPreferencesUtils: getIt()));
  getIt.registerSingleton<NavigationCubit>(NavigationCubit());
}

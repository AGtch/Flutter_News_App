import 'package:dio/dio.dart';
import 'package:flutter_news/data/services/handle_network_error.dart';
import 'package:flutter_news/data/services/remote_source/dio.dart';

import '../../../constants/strings/strings.dart';

class ApiService {
  final DioInit dio;

  ApiService({required this.dio});

  Future<List<dynamic>> getNewsArticlesResponse(
      {required String category,
      required String country,
      required int page}) async {
    Response response = await dio.getDio().get(
      'top-headlines',
      queryParameters: {
        'apiKey': apiKey,
        'country': country,
        'category': category.toLowerCase(),
        'page': page.toString(),
      },
    );
    if (response.statusCode == 200) {
      return response.data['articles'];
    } else {
      throw AppInterceptors(dio.getDio());
    }
  }

  Future<List<dynamic>> searchForNews({required String searchedNews}) async {
    Response response = await dio.getDio().get(
      'everything',
      queryParameters: {
        'apiKey': apiKey,
        'q': searchedNews,
      },
    );
    if (response.statusCode == 200) {
      return response.data['articles'];
    } else {
      throw AppInterceptors(dio.getDio());
    }
  }
}

import 'package:dio/dio.dart';

import '../../../constants/strings/strings.dart';
import '../handle_network_error.dart';

class DioInit {
  DioInit() {
    getDio();
  }

  Dio getDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        sendTimeout: 30 * 1000,
      ),
    );
    dio.interceptors.addAll({AppInterceptors(dio)});

    return dio;
  }
}

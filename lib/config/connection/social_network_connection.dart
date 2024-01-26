import 'package:dio/dio.dart';

final socialNetworkAPI =
    Dio(BaseOptions(baseUrl: 'http://localhost:3000', queryParameters: {
  'language': 'es-Mx',
}));

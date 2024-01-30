import 'package:dio/dio.dart';

final socialNetworkAPI = Dio(BaseOptions(
  baseUrl: 'https://social-network-utn-production.up.railway.app',
));

Options addToken(String token) {
  return Options(
    headers: {
      'Authorization': 'JWT $token',
    },
  );
}

import 'package:dio/dio.dart';
import 'package:utinder/config/connection/social_network_connection.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/infraestucture/infraestructure.dart';

class NetworkDatasource {
  Future<Session> loginUtinder(
      {required String email, required String password}) async {
    try {
      final response = await socialNetworkAPI.post('/auth/login', data: {
        "email": email,
        "password": password,
      });
      final dataMapper = LoginMapper.fromJson(response.data);
      final Session sesion = dataMapper.toSessionEntity();
      return sesion;
    } on DioException {
      return Session.getDefaultSession();
    }
  }

  Future<Session> registerUtinder({
    required String name,
    required String password,
    required String email,
    required String username,
    required String faculty,
  }) async {
    try {
      // Llamada al endpoint de registro
      await socialNetworkAPI.post('/auth/register', data: {
        "name": name,
        "password": password,
        "email": email,
        "username": username,
        "faculty": faculty,
      });
      return loginUtinder(email: email, password: password);
    } on DioException {
      return Session.getDefaultSession();
    }
  }

  Future<Session> updateUtinder(
      {required String email,
      required String password,
      required String name,
      required String username,
      required String faculty,
      required Session session}) async {
    try {
      await socialNetworkAPI.put('/auth/update',
          data: {
            "name": name,
            "username": username,
            "faculty": faculty,
            "email": email,
            "password": password,
          },
          options: addToken(session.token));
      final sesion = await loginUtinder(email: email, password: password);
      return sesion;
    } on DioException {
      return session;
    }
  }
}

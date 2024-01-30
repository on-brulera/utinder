import 'package:dio/dio.dart';
import 'package:utinder/config/connection/social_network_connection.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/infraestucture/infraestructure.dart';

class FollowDatasource {
  Future<Follows> getFollows({required String token}) async {
    try {
      final response =
          await socialNetworkAPI.get('/follow', options: addToken(token));
      final dataMapper = FollowMapper.fromJson(response.data);
      final data = dataMapper.toEntityFollows();
      return data;
    } on DioException catch (e) {
      return Session.getDefaultSession();
    }
  }

  Future<List<Person>> getAllUsers({required String token}) async {
    try {
      final response =
          await socialNetworkAPI.get('/auth/users', options: addToken(token));
      final dataMapper = UsersMapper.fromJson(response.data);
      final data = dataMapper.toPersonEntity();
      return data;
    } on DioException catch (e) {
      return Session.getDefaultSession();
    }
  }

  Future followUser({required String token, required int userId}) async {
    try {
      final ruta = "/follow/$userId";
      final response =
          await socialNetworkAPI.post(ruta, options: addToken(token));
      return response.data;
    } on DioException catch (e) {
      return Session.getDefaultSession();
    }
  }

  Future unfollowUser({required String token, required int userId}) async {
    try {
      final ruta = "/follow/$userId";
      final response =
          await socialNetworkAPI.delete(ruta, options: addToken(token));
      return response.data;
    } on DioException catch (e) {
      return Session.getDefaultSession();
    }
  }
}

Future getProfilePhoto({required String token, required int userId}) async {
  try {
    final ruta = "/image/profile/$userId";
    final response = await socialNetworkAPI.get(ruta, options: addToken(token));
    return response.data;
  } on DioException catch (e) {
    return Session.getDefaultSession();
  }
}

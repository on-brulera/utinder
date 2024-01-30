import 'package:utinder/domain/domain.dart';

class Session {
  final User user;
  final Profile profile;
  final String token;

  Session({required this.user, required this.profile, required this.token});

  static getDefaultSession() => Session(
      user: User(name: 'name', email: 'email'),
      profile: Profile(username: 'username', faculty: 'faculty'),
      token: 'NoToken');
  static getUnautorizedSession() => Session(
      user: User(name: 'name', email: 'email'),
      profile: Profile(
        username: 'username',
        faculty: 'faculty',
      ),
      token: 'NoAutorized');
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/infraestucture/infraestructure.dart';

class SessionNotifier extends StateNotifier<Session> {
  NetworkDatasource server = NetworkDatasource();

  SessionNotifier() : super(Session.getDefaultSession());

  void login({required String email, required String password}) async {
    final newState =
        await server.loginUtinder(email: email, password: password);
    state = newState;
  }

  void register({
    required String name,
    required String password,
    required String email,
    required String username,
    required String faculty,
  }) async{
    final newState = await server.registerUtinder(name: name, password: password, email: email, username: username, faculty: faculty);
    state = newState;
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, Session>((ref) {
  return SessionNotifier();
});

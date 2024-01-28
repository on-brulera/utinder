import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/infraestucture/infraestructure.dart';

class SessionNotifier extends StateNotifier<Session> {
  NetworkDatasource server = NetworkDatasource();
  bool doRequest = false;
  bool sessionAcepted = false;

  SessionNotifier() : super(Session.getUnautorizedSession());

  void login({required String email, required String password}) async {
    if (doRequest) return;
    doRequest = true;
    final newState =
        await server.loginUtinder(email: email, password: password);
    state = newState;
    sessionAcepted = true;
    doRequest = false;
  }

  void register({
    required String name,
    required String password,
    required String email,
    required String username,
    required String faculty,
  }) async {
    if (doRequest) return;
    doRequest = true;

    final newState = await server.registerUtinder(
        name: name,
        password: password,
        email: email,
        username: username,
        faculty: faculty);
    state = newState;
    doRequest = false;
    sessionAcepted = true;
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, Session>((ref) {
  return SessionNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/domain/domain.dart';
import 'package:utinder/infraestucture/infraestructure.dart';

class FollowsNotifier extends StateNotifier<Follows> {
  FollowDatasource follow = FollowDatasource();
  bool doRequest = false;
  bool sessionAcepted = false;

  FollowsNotifier() : super(Follows(following: [], followers: []));

  void follows({required String token}) async {
    if (doRequest) return;
    doRequest = true;
    final followsState = await follow.getFollows(token: token);
    state = followsState;
    sessionAcepted = true;
    doRequest = false;
  }

  void followProfile({required String token, required int userId}) async {
    if (doRequest) return;
    doRequest = true;
    await follow.followUser(token: token, userId: userId);
    sessionAcepted = true;
    doRequest = false;
  }

  void unfollowProfile({required String token, required int userId}) async {
    if (doRequest) return;
    doRequest = true;
    await follow.unfollowUser(token: token, userId: userId);
    sessionAcepted = true;
    doRequest = false;
  }
}

final followsProvider = StateNotifierProvider<FollowsNotifier, Follows>((ref) {
  return FollowsNotifier();
});

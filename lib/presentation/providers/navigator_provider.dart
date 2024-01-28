import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatorNotifier extends StateNotifier<int> {
  NavigatorNotifier() : super(1);

  void setIndexNavigator({required int index}) {
    state = index;
  }
}

final navigatorProvider = StateNotifierProvider<NavigatorNotifier, int>((ref) {
  return NavigatorNotifier();
});

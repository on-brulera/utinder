import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeScreenNotifierProvider =
    StateNotifierProvider<ThemeScrean, bool>((ref) => ThemeScrean());

class ThemeScrean extends StateNotifier<bool> {
  ThemeScrean() : super(false);
  void toggleDarkMode() {
    state = !state;
  }
}

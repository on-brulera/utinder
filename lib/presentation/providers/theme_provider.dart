import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/config/theme/app_theme.dart';

//activado modo oscuro
final isDarkMode = StateProvider((ref) => false);

//estado de colores inmutables
final colorListProvider = Provider((ref) => colores);

final selectedIndexProvider = StateProvider((ref) => 0);

//crear un objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//clase controlador o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //state: instancia de una clase general
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

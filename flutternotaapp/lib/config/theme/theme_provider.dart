import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
//el que controla es el themeNotifier, y el estado es una instancia de appTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o Notifier
//se va a encargar de mantener un estado en particular
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

import 'package:flutter/material.dart';

List colores = <Color>[
  Colors.black,
  Colors.red,
  Colors.white,
  Colors.blue,
  Colors.green,
  Colors.amber
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colores.length,
            'selected color must be 0 - ${colores.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFEEF1F8),
      fontFamily: "Intel",
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colores[selectedColor],
      inputDecorationTheme: getDecoration(),
      appBarTheme: const AppBarTheme(centerTitle: true));

  InputDecorationTheme getDecoration() => const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(height: 0),
        border: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        errorBorder: defaultInputBorder,
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
  useMaterial3: true,
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  useMaterial3: true,
);

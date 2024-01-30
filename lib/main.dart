import 'package:flutter/material.dart';
import 'package:utinder/config/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utinder/config/theme/app_theme.dart';
import 'package:utinder/presentation/presentation.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final bool isDark = ref.watch(themeScreenNotifierProvider);

    return MaterialApp.router(
      title: 'Utinder',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: darkTheme,
      routerConfig: appRouter,
    );    
  }
}

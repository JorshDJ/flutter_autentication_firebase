import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutternotaapp/config/router/app_routes.dart';
import 'package:flutternotaapp/config/theme/app_theme.dart';
import 'package:flutternotaapp/config/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Nota App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}

import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routing/app_router.dart';

void main() {
  runApp(const FutureleanApp());
}

class FutureleanApp extends StatelessWidget {
  const FutureleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FUTURELEAN AND SERVICE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
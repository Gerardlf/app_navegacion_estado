import 'package:app_navegacion_estado/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "UD6 · Navegación + Estado (MVVM)",
      routerConfig: AppRouter.goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

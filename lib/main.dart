import 'package:calc/screens/home.dart';
import 'package:calc/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalcApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

void main() {
  runApp(CalcApp());
}

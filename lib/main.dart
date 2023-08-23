import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_gorouter/login_page.dart';
import 'package:learn_gorouter/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginView();
        }),
    GoRoute(
      path: '/',
      name: 'main_page',
      builder: (context, state) {
        return const MainPageView();
      },
    )
  ], initialLocation: '/login', debugLogDiagnostics: true, routerNeglect: true);
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}

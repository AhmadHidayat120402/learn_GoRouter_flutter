import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_gorouter/about_page.dart';
import 'package:learn_gorouter/edit_profile_page.dart';
import 'package:learn_gorouter/login_page.dart';
import 'package:learn_gorouter/main_page.dart';
import 'package:learn_gorouter/profile_page.dart';
import 'package:learn_gorouter/user.dart';

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
        routes: [
          GoRoute(
              path: 'about',
              name: 'about',
              builder: ((context, state) {
                return const AboutPageView();
              })),
          GoRoute(
              path: 'profile/:name',
              name: 'profile',
              builder: (context, state) {
                String name = state.pathParameters['name'] ?? "no name";
                return ProfilePage(name: name);
              },
              routes: [
                GoRoute(
                    path: 'edit_profile',
                    name: 'edit_profile',
                    builder: (context, state) {
                      // ambil objek
                      Object? object = state.extra;

                      if (object != null && object is User) {
                        return EditProfile(user: object);
                      } else {
                        return const EditProfile(
                            user: User('no name', 'no email'));
                      }
                    })
              ]),
        ])
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

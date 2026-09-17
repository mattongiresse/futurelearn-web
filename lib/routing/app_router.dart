//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      // On ajoutera les autres pages ici plus tard :
      // GoRoute(path: '/about', ...),
      // GoRoute(path: '/services', ...),
      // GoRoute(path: '/process', ...),
      // GoRoute(path: '/contact', ...),
    ],
  );
}
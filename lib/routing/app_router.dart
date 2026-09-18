import 'package:go_router/go_router.dart';
import '../features/home/home_page.dart';
import '../features/about/about_page.dart';
import '../features/services/services_page.dart';
import '../features/process/process_page.dart';
import '../features/contact/contact_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: '/services',
        name: 'services',
        builder: (context, state) => const ServicesPage(),
      ),
      GoRoute(
        path: '/process',
        name: 'process',
        builder: (context, state) => const ProcessPage(),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),
    ],
  );
}
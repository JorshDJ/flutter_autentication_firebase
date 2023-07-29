import 'package:flutternotaapp/features/authentication/presentation/pages/login_page.dart';
import 'package:flutternotaapp/features/authentication/presentation/pages/register_page.dart';
import 'package:flutternotaapp/features/authentication/presentation/pages/tutorial_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      //name: HomeScreen.name,
      builder: (context, state) => const TutorialPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      //name: ButtonsScreen.name,
      builder: (context, state) => RegisterPage(),
    ),
  ],
);

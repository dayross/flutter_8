import 'package:flutter_8/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => ButtonsScreens(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    )
  ],
);

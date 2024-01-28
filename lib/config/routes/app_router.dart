import 'package:go_router/go_router.dart';
import 'package:utinder/presentation/presentation.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/posts',
    name: PostsScreen.name,
    builder: (context, state) => const PostsScreen(),
  ),
  GoRoute(
    path: '/lokingfor',
    name: LookingForScreen.name,
    builder: (context, state) => const LookingForScreen(),
  ),
  GoRoute(
    path: '/foryou',
    name: ForYouScreen.name,
    builder: (context, state) => const ForYouScreen(),
  ),
  GoRoute(
    path: '/profile',
    name: ProfileScreen.name,
    builder: (context, state) => const ProfileScreen(),
  ),
]);

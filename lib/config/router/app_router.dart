import 'package:go_router/go_router.dart';
import 'package:prueba_ceiba/features/user/user.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
      path: 'posts/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        final user = state.extra as User;
        return PostUserScreen(
          userId: int.tryParse(userId ?? '0') ?? 0,
          user: user,
        );
      },
    )
  ])
]);

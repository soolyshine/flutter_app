import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'repository/person_repository.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'views/home_view.dart';
import 'views/profile_view.dart';

void main() {
  final repository = PersonRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(repository)),
        ChangeNotifierProvider(create: (_) => ProfileViewModel(repository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const HomeView(),
        ),
        GoRoute(
          path: '/profile/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ProfileView(id: id);
          },
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Profile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

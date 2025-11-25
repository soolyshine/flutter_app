import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


import 'repository/person_repository.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'views/home_view.dart';
import 'views/profile_view.dart';


import 'services/github_service.dart';
import 'repository/github_repository.dart';
import 'viewmodels/github_viewmodel.dart';
import 'views/github_view.dart';

void main() {
  
  final personRepository = PersonRepository();

  
  final githubService = GitHubService();
  final githubRepository = GitHubRepository(githubService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(personRepository)),
        ChangeNotifierProvider(create: (_) => ProfileViewModel(personRepository)),
        ChangeNotifierProvider(create: (_) => GitHubViewModel(githubRepository)), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
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
    
        GoRoute(
          path: '/github',
          builder: (_, __) => const GitHubView(),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final persons = vm.persons;

    return Scaffold(
      appBar: AppBar(title: const Text('Інформація про себе')),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (_, index) {
          final person = persons[index];
          return ListTile(
            title: Text(person.title),
            subtitle: Text(person.description, maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.go('/profile/${person.id}'),
          );
        },
      ),
    );
  }
}

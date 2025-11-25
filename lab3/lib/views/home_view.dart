import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final user = vm.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Головна')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
              title: Text(user.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(user.title),
            ),
            const SizedBox(height: 16),
            Text(
              user.bio,
              style: const TextStyle(fontSize: 16),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => context.go('/profile'),
              icon: const Icon(Icons.person),
              label: const Text('Детальніше про мене'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

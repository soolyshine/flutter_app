import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  void _showEditBioDialog(BuildContext context) {
    final vm = context.read<ProfileViewModel>();
    final controller = TextEditingController(text: vm.user.bio);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Редагувати біо'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(hintText: 'Напиши коротке резюме...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Скасувати'),
          ),
          ElevatedButton(
            onPressed: () {
              vm.updateBio(controller.text.trim());
              Navigator.of(context).pop();
            },
            child: const Text('Зберегти'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final user = vm.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Профіль')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            const SizedBox(height: 12),
            Text(user.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(user.title, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Про мене', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(user.bio),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => _showEditBioDialog(context),
                        icon: const Icon(Icons.edit),
                        label: const Text('Редагувати'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(user.email),
                subtitle: const Text('Email'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(user.phone),
                subtitle: const Text('Телефон'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}

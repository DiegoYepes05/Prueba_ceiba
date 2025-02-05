import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_ceiba/config/config.dart';
import 'package:prueba_ceiba/features/user/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de ingreso'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends ConsumerWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredUsers = ref.watch(filteredUsersProvider);
    final isLoading = ref.watch(usersProvider).isLoading;

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: colorPrimary,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) =>
                ref.read(searchQueryProvider.notifier).state = value,
            label: 'Buscar usuario',
          ),
          const SizedBox(height: 30),
          if (filteredUsers.isEmpty &&
              ref.watch(searchQueryProvider).isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'List is empty',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (_, index) =>
                    CustomCard(user: filteredUsers[index]),
              ),
            ),
        ],
      ),
    );
  }
}

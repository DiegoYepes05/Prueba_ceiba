import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_ceiba/features/user/user.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredUsersProvider = Provider<List<User>>((ref) {
  final users = ref.watch(usersProvider).users;
  final searchQuery = ref.watch(searchQueryProvider);

  if (searchQuery.isEmpty) return users;

  return users
      .where(
          (user) => user.name.toLowerCase().contains(searchQuery.toLowerCase()))
      .toList();
});

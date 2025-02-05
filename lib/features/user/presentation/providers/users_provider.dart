import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_ceiba/features/user/user.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UsersNotifier(userRepository: userRepository);
});

class UsersNotifier extends StateNotifier<UsersState> {
  final UserRepository userRepository;

  UsersNotifier({required this.userRepository}) : super(UsersState()) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      state = state.copyWith(isLoading: true);

      if (await userRepository.hasLocalUsers()) {
        final localUsers = await userRepository.getLocalUsers();
        if (localUsers != null && localUsers.isNotEmpty) {
          state = state.copyWith(users: localUsers, isLoading: false);
          return;
        }
      }

      final users = await userRepository.getUsers();
      state = state.copyWith(users: users, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> refreshUsers() async {
    try {
      state = state.copyWith(isLoading: true);
      final users = await userRepository.getUsers();
      state = state.copyWith(users: users, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}

class UsersState {
  final List<User> users;
  final bool isLoading;
  final String? error;

  UsersState({
    this.users = const [],
    this.isLoading = false,
    this.error,
  });

  UsersState copyWith({
    List<User>? users,
    bool? isLoading,
    String? error,
  }) =>
      UsersState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}

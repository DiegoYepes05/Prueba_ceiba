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

  Future loadUsers() async {
    final users = await userRepository.getUsers();

    state = state.copyWith(users: [...state.users, ...users]);
  }
}

class UsersState {
  final List<User> users;

  UsersState({this.users = const []});

  UsersState copyWith({List<User>? users}) =>
      UsersState(users: users ?? this.users);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_ceiba/features/user/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userRepository = UserRepositoryImpl(UserDatasourcesImpl());
  return userRepository;
});

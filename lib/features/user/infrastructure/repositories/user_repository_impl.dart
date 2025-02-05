import 'package:prueba_ceiba/features/user/user.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);
  @override
  Future<List<User>> getUsers() {
    return datasource.getUsers();
  }

  @override
  Future<List<Post>> getPostByUser(int userId) {
    return datasource.getPostByUser(userId);
  }

  @override
  Future<List<User>?> getLocalUsers() {
    return datasource.getLocalUsers();
  }

  @override
  Future<bool> hasLocalUsers() {
    return datasource.hasLocalUsers();
  }

  @override
  Future<void> saveUsersLocally(List<User> users) {
    return datasource.saveUsersLocally(users);
  }
}

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
}

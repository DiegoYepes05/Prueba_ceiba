import 'package:prueba_ceiba/features/user/user.dart';

abstract class UserDatasource {
  Future<List<User>> getUsers();
  Future<List<Post>> getPostByUser(int userId);
}

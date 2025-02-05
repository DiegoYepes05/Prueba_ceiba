import 'package:dio/dio.dart';
import 'package:prueba_ceiba/features/user/user.dart';

class UserDatasourcesImpl extends UserDatasource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  @override
  Future<List<User>> getUsers() async {
    final response = await dio.get<List>('users');

    final List<User> users = [];
    for (final user in response.data ?? []) {
      users.add(UserMappers.jsonToEntity(user));
    }
    return users;
  }

  @override
  Future<List<Post>> getPostByUser(int userId) async {
    final response = await dio.get<List>('/posts?$userId');

    final List<Post> postsUser = [];
    for (final user in response.data ?? []) {
      postsUser.add(PostUserMapper.jsonToEntity(user));
    }
    return postsUser;
  }
}

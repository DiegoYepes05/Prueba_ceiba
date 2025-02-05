import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:prueba_ceiba/features/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDatasourcesImpl extends UserDatasource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  static const String _userKey = 'stored_users';

  @override
  Future<List<User>> getUsers() async {
    final response = await dio.get<List>('users');

    final List<User> users = [];
    for (final user in response.data ?? []) {
      users.add(UserMappers.jsonToEntity(user));
    }

    await saveUsersLocally(users);
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

  @override
  Future<List<User>?> getLocalUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userListString = prefs.getString(_userKey);

    if (userListString == null) return null;

    try {
      final userListJson = jsonDecode(userListString) as List;
      return userListJson
          .map((json) => UserMappers.jsonToEntity(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> hasLocalUsers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }

  @override
  Future<void> saveUsersLocally(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson =
        users.map((user) => UserMappers.entityToJson(user)).toList();
    await prefs.setString(_userKey, jsonEncode(userListJson));
  }
}

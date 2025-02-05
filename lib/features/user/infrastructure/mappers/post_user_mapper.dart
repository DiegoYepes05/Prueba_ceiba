import 'package:prueba_ceiba/features/user/user.dart';

class PostUserMapper {
  static Post jsonToEntity(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}

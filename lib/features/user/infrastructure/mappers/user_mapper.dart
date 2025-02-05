import 'package:prueba_ceiba/features/user/user.dart';

class UserMappers {
  static User jsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
        lat: json['address']['geo']['lat'],
        lng: json['address']['geo']['lng'],
        phone: json['phone'],
        website: json['website'],
        companyName: json['company']['name'],
        companyCatchPhrase: json['company']['catchPhrase'],
        companyBs: json['company']['bs'],
      );
}

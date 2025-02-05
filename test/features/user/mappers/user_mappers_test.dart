import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ceiba/features/user/user.dart';

void main() {
  group('UserMappers Tests', () {
    test('jsonToEntity maps correctly', () {
      final json = {
        'id': 1,
        'name': 'Test Name',
        'username': 'test',
        'email': 'test@email.com',
        'address': {
          'street': 'Street',
          'suite': 'Suite',
          'city': 'City',
          'zipcode': '12345',
          'geo': {'lat': '1.0', 'lng': '2.0'}
        },
        'phone': '123456',
        'website': 'test.com',
        'company': {'name': 'Company', 'catchPhrase': 'Catch', 'bs': 'BS'}
      };

      final result = UserMappers.jsonToEntity(json);

      expect(result.id, 1);
      expect(result.name, 'Test Name');
      expect(result.email, 'test@email.com');
      expect(result.street, 'Street');
      expect(result.city, 'City');
    });

    test('entityToJson maps correctly', () {
      final user = User(
          id: 1,
          name: 'Test Name',
          username: 'test',
          email: 'test@email.com',
          street: 'Street',
          suite: 'Suite',
          city: 'City',
          zipcode: '12345',
          lat: '1.0',
          lng: '2.0',
          phone: '123456',
          website: 'test.com',
          companyName: 'Company',
          companyCatchPhrase: 'Catch',
          companyBs: 'BS');

      final json = UserMappers.entityToJson(user);

      expect(json['id'], 1);
      expect(json['name'], 'Test Name');
      expect(json['email'], 'test@email.com');
      expect(json['address']['street'], 'Street');
      expect(json['company']['name'], 'Company');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_ceiba/features/user/user.dart';

class MockUserDatasource extends Mock implements UserDatasource {}

void main() {
  late UserRepository repository;
  late MockUserDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockUserDatasource();
    repository = UserRepositoryImpl(mockDatasource);
  });

  setUpAll(() {
    registerFallbackValue(User(
      id: 1,
      name: 'Leanne Graham',
      username: 'Bret',
      email: 'Sincere@april.biz',
      street: 'Kulas Light',
      suite: 'Apt. 556',
      city: 'Gwenborough',
      zipcode: '92998-3874',
      lat: '-37.3159',
      lng: '81.1496',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
      companyName: 'Romaguera-Crona',
      companyCatchPhrase: 'Multi-layered client-server neural-net',
      companyBs: 'harness real-time e-markets',
    ));
  });

  final testUser = User(
    id: 1,
    name: 'Leanne Graham',
    username: 'Bret',
    email: 'Sincere@april.biz',
    street: 'Kulas Light',
    suite: 'Apt. 556',
    city: 'Gwenborough',
    zipcode: '92998-3874',
    lat: '-37.3159',
    lng: '81.1496',
    phone: '1-770-736-8031 x56442',
    website: 'hildegard.org',
    companyName: 'Romaguera-Crona',
    companyCatchPhrase: 'Multi-layered client-server neural-net',
    companyBs: 'harness real-time e-markets',
  );

  group('UserRepository Tests', () {
    test('getUsers debería retornar lista de usuarios desde datasource',
        () async {
      when(() => mockDatasource.getUsers()).thenAnswer((_) async => [testUser]);

      final result = await repository.getUsers();

      expect(result, equals([testUser]));
      verify(() => mockDatasource.getUsers()).called(1);
    });

    test('getUsers debería lanzar una excepción si falla el datasource',
        () async {
      when(() => mockDatasource.getUsers())
          .thenThrow(Exception('Error al obtener usuarios'));

      expect(() async => await repository.getUsers(), throwsException);
      verify(() => mockDatasource.getUsers()).called(1);
    });

    test('hasLocalUsers debería verificar almacenamiento local', () async {
      when(() => mockDatasource.hasLocalUsers()).thenAnswer((_) async => true);

      final result = await repository.hasLocalUsers();

      expect(result, isTrue);
      verify(() => mockDatasource.hasLocalUsers()).called(1);
    });

    test('getLocalUsers debería obtener usuarios del almacenamiento local',
        () async {
      when(() => mockDatasource.getLocalUsers())
          .thenAnswer((_) async => [testUser]);

      final result = await repository.getLocalUsers();

      expect(result, equals([testUser]));
      verify(() => mockDatasource.getLocalUsers()).called(1);
    });

    test(
        'getLocalUsers debería lanzar una excepción si falla el almacenamiento local',
        () async {
      when(() => mockDatasource.getLocalUsers())
          .thenThrow(Exception('Error en almacenamiento local'));

      expect(() async => await repository.getLocalUsers(), throwsException);
      verify(() => mockDatasource.getLocalUsers()).called(1);
    });
  });
}

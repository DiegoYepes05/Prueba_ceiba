import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_ceiba/features/user/user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockUserRepository mockRepository;

  setUp(() {
    mockRepository = MockUserRepository();
  });

  testWidgets('PostUserScreen muestra los datos del usuario',
      (WidgetTester tester) async {
    final testUser = User(
      id: 1,
      name: 'John Doe',
      username: 'john',
      email: 'john@test.com',
      street: 'Street',
      suite: '123',
      city: 'City',
      zipcode: '12345',
      lat: '0',
      lng: '0',
      phone: '1234567890',
      website: 'test.com',
      companyName: 'Company',
      companyCatchPhrase: 'Catchphrase',
      companyBs: 'BS',
    );

    final testPost =
        Post(userId: 1, id: 1, title: 'Test Title', body: 'Test Body');

    when(() => mockRepository.getPostByUser(any()))
        .thenAnswer((_) async => [testPost]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: MaterialApp(
          home: PostUserScreen(userId: 1, user: testUser),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john@test.com'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('PostUserScreen muestra AppBar con título correcto',
      (WidgetTester tester) async {
    final testUser = User(
      id: 1,
      name: 'John Doe',
      username: 'john',
      email: 'john@test.com',
      street: 'Street',
      suite: '123',
      city: 'City',
      zipcode: '12345',
      lat: '0',
      lng: '0',
      phone: '1234567890',
      website: 'test.com',
      companyName: 'Company',
      companyCatchPhrase: 'Catchphrase',
      companyBs: 'BS',
    );

    final testPost =
        Post(userId: 1, id: 1, title: 'Test Title', body: 'Test Body');

    when(() => mockRepository.getPostByUser(any()))
        .thenAnswer((_) async => [testPost]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: MaterialApp(
          home: PostUserScreen(userId: 1, user: testUser),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Publicaciones usuario: 1'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
  });
}

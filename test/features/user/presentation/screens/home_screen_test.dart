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

  testWidgets('HomeScreen muestra lista de usuarios',
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

    when(() => mockRepository.hasLocalUsers()).thenAnswer((_) async => true);
    when(() => mockRepository.getLocalUsers())
        .thenAnswer((_) async => [testUser]);
    when(() => mockRepository.getUsers()).thenAnswer((_) async => [testUser]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(CustomCard), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
  });

  testWidgets('HomeScreen muestra campo de búsqueda',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(CustomTextFormField), findsOneWidget);
    expect(find.text('Buscar usuario'), findsOneWidget);
  });

  testWidgets('HomeScreen filtra usuarios', (WidgetTester tester) async {
    final testUsers = [
      User(
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
      ),
      User(
        id: 2,
        name: 'Jane Smith',
        username: 'jane',
        email: 'jane@test.com',
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
      ),
    ];

    when(() => mockRepository.hasLocalUsers()).thenAnswer((_) async => true);
    when(() => mockRepository.getLocalUsers())
        .thenAnswer((_) async => testUsers);
    when(() => mockRepository.getUsers()).thenAnswer((_) async => testUsers);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(CustomCard), findsNWidgets(2));

    await tester.enterText(find.byType(CustomTextFormField), 'John');
    await tester.pump();

    expect(find.byType(CustomCard), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Jane Smith'), findsNothing);
  });
}

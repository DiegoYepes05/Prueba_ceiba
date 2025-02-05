import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_ceiba/features/user/user.dart';

void main() {
  testWidgets('CustomCard muestra información del usuario correctamente',
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(user: testUser),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
    expect(find.text('john@test.com'), findsOneWidget);
    expect(find.text('VER PUBLICACIONES'), findsOneWidget);
  });

  testWidgets('CustomCard muestra iconos correctamente',
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(user: testUser),
        ),
      ),
    );

    expect(find.byIcon(Icons.phone), findsOneWidget);
    expect(find.byIcon(Icons.mail), findsOneWidget);
  });

  testWidgets('CustomCard tiene el botón de ver publicaciones',
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(user: testUser),
        ),
      ),
    );

    expect(find.byType(TextButton), findsOneWidget);
    expect(find.text('VER PUBLICACIONES'), findsOneWidget);
  });

  testWidgets('CustomCard tiene estructura correcta',
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(user: testUser),
        ),
      ),
    );

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsNWidgets(2));
    expect(find.byType(TextButton), findsOneWidget);
  });
}

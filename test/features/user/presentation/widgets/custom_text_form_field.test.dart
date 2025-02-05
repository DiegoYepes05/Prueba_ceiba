import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prueba_ceiba/features/user/user.dart';

void main() {
  testWidgets('CustomTextFormField muestra label cuando se proporciona',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(
            label: 'Test Label',
          ),
        ),
      ),
    );

    expect(find.text('Test Label'), findsOneWidget);
  });

  testWidgets('CustomTextFormField no muestra label cuando es null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
  });

  testWidgets('CustomTextFormField llama onChanged cuando el texto cambia',
      (WidgetTester tester) async {
    String? changedText;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(
            onChanged: (value) => changedText = value,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Nuevo texto');
    expect(changedText, equals('Nuevo texto'));
  });

  testWidgets('CustomTextFormField mantiene el tipo TextFormField',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomTextFormField(),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);
  });
}

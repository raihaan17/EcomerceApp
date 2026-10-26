import 'package:ecomerceapp/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('sent messages persist when the chat page is reopened', (
    tester,
  ) async {
    Widget buildChat() =>
        const MaterialApp(home: ChatScreen(contactName: 'Test seller'));

    await tester.pumpWidget(buildChat());
    await tester.enterText(find.byType(TextField), 'Pesan tersimpan');
    await tester.tap(find.byIcon(Icons.send_rounded));
    await tester.pumpAndSettle();

    expect(find.text('Pesan tersimpan'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(buildChat());
    await tester.pumpAndSettle();

    expect(find.text('Pesan tersimpan'), findsOneWidget);
  });
}

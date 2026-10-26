import 'package:ecomerceapp/pages/account_page.dart';
import 'package:ecomerceapp/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('favorite button toggles its selected state', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: ItemWidgets())),
      ),
    );

    final favoriteButton = find.byTooltip('Tambahkan ke favorit').first;
    await tester.tap(favoriteButton);
    await tester.pump();

    expect(find.byTooltip('Hapus dari favorit'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
  });

  testWidgets('account back button returns to the previous page', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const AccountPage()),
                );
              },
              child: const Text('Halaman sebelumnya'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Halaman sebelumnya'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Akun Saya'), findsOneWidget);
    await tester.tap(find.byTooltip('Kembali'));
    await tester.pump();

    expect(find.text('Halaman sebelumnya'), findsOneWidget);
  });
}

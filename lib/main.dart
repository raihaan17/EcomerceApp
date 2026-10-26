import 'package:ecomerceapp/pages/list_chat.dart';
import 'package:flutter/material.dart';
import 'package:ecomerceapp/pages/login_page.dart';
import 'package:ecomerceapp/pages/register_page.dart';
import 'package:ecomerceapp/pages/account_page.dart';
import 'package:ecomerceapp/pages/change_password_page.dart';
import 'package:ecomerceapp/pages/cart_page.dart';
import 'package:ecomerceapp/pages/home_page.dart';
import 'package:ecomerceapp/pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce ',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xff17191c),
          onPrimary: Colors.white,
          secondary: Color(0xff0b7285),
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xff24282d),
          error: Color(0xffb42318),
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xfff8f9fa),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff24282d),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Color(0xff24282d),
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Color(0xff24282d)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff1f3f5),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffe5e7eb)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff17191c), width: 1.2),
          ),
          labelStyle: const TextStyle(color: Color(0xff6b7280)),
          hintStyle: const TextStyle(color: Color(0xff9ca3af)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff17191c),
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: const Size(48, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xff17191c),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(),
        '/account_page': (context) => const AccountPage(),
        '/change_password_page': (context) => const ChangePasswordPage(),
        '/cart_page': (context) => const CartPage(),
        '/home_page': (context) => const HomePage(),
        '/list_chat': (context) => const ChatListPage(),
        '/detail_page': (context) => const ChatScreen(contactName: 'Penjual'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body: Center(
        child: Column(mainAxisAlignment: .center, children: [
            
          ],
        ),
      ),
    );
  }
}

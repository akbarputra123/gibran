import 'package:flutter/material.dart';
import 'package:flutter_baskara/login/login.dart';
import 'package:flutter_baskara/user/user_home.dart'; // Tambahkan halaman lain di sini
import 'package:flutter_baskara/user/user_profil.dart'; // Tambahkan halaman lain di sini

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Halaman awal aplikasi
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardUser(),
        '/akun': (context) => AkunPage(),
        // Tambahkan rute lainnya di sini
      },
    );
  }
}

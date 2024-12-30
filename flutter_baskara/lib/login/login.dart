import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/AdminBeranda.dart';
import 'package:flutter_baskara/user/user_home.dart';

import 'buatakun.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "123") {
      // Navigasi ke halaman Admin
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardAdmin()),
      );
    } else if (username != "" && password == "123") {
      // Navigasi ke halaman Dashboard User
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardUser()),
      );
    } else {
      // Login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Gagal! Username atau Password Salah'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul
              const Text(
                "Baskara Green",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),

              // Kotak Username
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Kotak Password
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Tombol Login
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Divider Text "or"
              const Text(
                "or",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Teks "don't have an account?" dan tautan "create an account"
              Column(
                children: [
                  const Text(
                    "don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Aksi untuk create an account
                    },
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAccountScreen()),
                        );
                      },
                      child: const Text(
                        "create an account",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

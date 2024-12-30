import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/admin_data_sampah.dart';
import 'package:flutter_baskara/admin/admin_edit_data.dart';
import 'package:flutter_baskara/admin/admin_lihat_data.dart';
import 'package:flutter_baskara/admin/admin_profil.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'BASKARA GREEN',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '"Selamat datang di Baskara Green"\nAplikasi Bank Sampah untuk lingkungan\nyang lebih bersih dan hijau...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditDataApp()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Edit Data',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SampahPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Setor Sampah',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardAdmin()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Beranda',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LihatData()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Informasi',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AkunPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Akun',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

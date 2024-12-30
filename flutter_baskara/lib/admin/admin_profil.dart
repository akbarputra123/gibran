import 'package:flutter/material.dart';
import 'package:flutter_baskara/login/login.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Warna hijau AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
        title: const Text(
          'Akun',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ikon profil
              CircleAvatar(
                radius: screenSize.width < 600 ? 40 : 60, // Responsif
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  size: screenSize.width < 600 ? 40 : 60, // Responsif
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              // Nama pengguna
              Text(
                'ADMIN BASKARA GREEN',
                style: TextStyle(
                  fontSize: screenSize.width < 600 ? 18 : 22, // Responsif
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              // Informasi pengguna
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'Admin Baskara Green',
              ),
              _buildInfoRow(
                context,
                icon: Icons.monetization_on_outlined,
                label: 'Rp 2.000.000',
              ),
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                label: 'Bank Sampah Bastiong',
              ),
              // Tombol keluar
              const SizedBox(height: 16),
              Container(
                width: screenSize.width < 600
                    ? double.infinity
                    : screenSize.width * 0.5, // Responsif
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          _showLogoutConfirmation(context); // Menampilkan dialog konfirmasi logout
                        }),
                    const SizedBox(width: 8),
                    Text(
                      'Keluar',
                      style: TextStyle(
                        fontSize: screenSize.width < 600 ? 14 : 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk baris informasi
  Widget _buildInfoRow(BuildContext context,
      {required IconData icon, required String label, bool isExit = false}) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isExit ? Colors.red : Colors.green,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenSize.width < 600 ? 14 : 16,
                color: isExit ? Colors.red : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Menampilkan dialog konfirmasi untuk keluar
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog jika pilih batal
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(), // Arahkan ke halaman login
                  ),
                );
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

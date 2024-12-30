import 'package:flutter/material.dart';

class LihatData extends StatelessWidget {
  const LihatData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double size =
              constraints.maxWidth * 0.2; // Ukuran 20% dari lebar layar
          return Padding(
            padding: const EdgeInsets.only(top: 24.0), // Tambahkan padding atas
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start, // Mendorong ke atas
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.green),
                        onPressed: () {
                          Navigator.pop(
                              context); // Kembali ke halaman sebelumnya
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Lihat Data',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DataButton(
                        icon: Icons.people,
                        label: 'Data Masyarakat',
                        size: size,
                        onPressed: () {
                          // Tambahkan fungsi untuk Data Masyarakat
                        },
                      ),
                      const SizedBox(height: 16),
                      DataButton(
                        icon: Icons.delete,
                        label: 'Data Sampah',
                        size: size,
                        onPressed: () {
                          // Tambahkan fungsi untuk Data Sampah
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DataButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;
  final VoidCallback onPressed;

  const DataButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.green, size: size * 0.5),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}

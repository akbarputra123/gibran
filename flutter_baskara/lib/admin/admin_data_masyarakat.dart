import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Bagian atas dengan latar hijau
          Container(
            color: Colors.green, // Latar belakang hijau
            padding: const EdgeInsets.only(
              top: 40, // Padding atas untuk status bar
              bottom:
                  16, // Padding bawah agar teks dan ikon tidak terlalu mepet
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    // Tambahkan fungsi untuk panah kembali
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Data Masyarakat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16), // Jarak antara header dan ikon
                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.people, color: Colors.green, size: 60),
                        const SizedBox(
                            height: 16), // Jarak antara ikon dan list
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height - 200,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: const [
                              MasyarakatCard(
                                nama: 'Abdullah',
                                alamat: 'Bastiong RW 02',
                                saldo: '150 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Aliya Abd',
                                alamat: 'Bastiong RW 03',
                                saldo: '50 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Billal Alam',
                                alamat: 'Mangga Dua RW 1',
                                saldo: '100 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Hadi Salim',
                                alamat: 'Mangga Dua RW 3',
                                saldo: '200 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Kamaludin',
                                alamat: 'Dufa-Dufa RW 1',
                                saldo: '250 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Nurul Fikri',
                                alamat: 'Jati RW 2',
                                saldo: '300 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Rina Wati',
                                alamat: 'Gambesi RW 5',
                                saldo: '120 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Santi Putri',
                                alamat: 'Fitu RW 1',
                                saldo: '130 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Farhan Zaki',
                                alamat: 'Sasa RW 4',
                                saldo: '75 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Zahra Fina',
                                alamat: 'Tafure RW 3',
                                saldo: '50 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Taufik Hidayat',
                                alamat: 'Akehuda RW 4',
                                saldo: '80 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Rudi Hartono',
                                alamat: 'Kulaba RW 1',
                                saldo: '60 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Lina Mustika',
                                alamat: 'Jati RW 3',
                                saldo: '90 Ribu',
                              ),
                              MasyarakatCard(
                                nama: 'Aditya Nugraha',
                                alamat: 'Mangga Duua RW 3',
                                saldo: '110 Ribu',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MasyarakatCard extends StatelessWidget {
  final String nama;
  final String alamat;
  final String saldo;

  const MasyarakatCard({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.saldo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50], // Warna latar hijau muda
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Masyarakat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green, // Warna teks hijau
            ),
          ),
          const SizedBox(height: 8),
          Text('Nama : $nama', style: const TextStyle(color: Colors.black)),
          Text('Alamat : $alamat', style: const TextStyle(color: Colors.black)),
          Text('Saldo  : $saldo', style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

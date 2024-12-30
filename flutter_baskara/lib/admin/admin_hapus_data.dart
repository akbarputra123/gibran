import 'package:flutter/material.dart';

class EditDataApp extends StatelessWidget {
  const EditDataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HapusDataScreen(),
    );
  }
}

class HapusDataScreen extends StatefulWidget {
  const HapusDataScreen({Key? key}) : super(key: key);

  @override
  _HapusDataScreenState createState() => _HapusDataScreenState();
}

class _HapusDataScreenState extends State<HapusDataScreen> {
  // Menyimpan data sementara, misalnya daftar data yang ada
  List<String> dataList = ['Data 1', 'Data 2', 'Data 3', 'Data 4'];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hapus Data'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Masukkan Data yang Ingin Dihapus',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Data yang akan dihapus',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Menghapus data jika ditemukan
                String dataToDelete = _controller.text;

                if (dataList.contains(dataToDelete)) {
                  setState(() {
                    dataList.remove(dataToDelete); // Menghapus data dari daftar
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil dihapus!')),
                  );
                  _controller.clear(); // Membersihkan input
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data tidak ditemukan')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Lebar tombol penuh
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Hapus Data',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman lihat data dan kirim dataList yang telah diperbarui
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LihatDataScreen(dataList: dataList)),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.grey,
              ),
              child: const Text('Lihat Data', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class LihatDataScreen extends StatelessWidget {
  final List<String> dataList; // Menerima data yang telah diperbarui

  const LihatDataScreen({Key? key, required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Data'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataList[index]),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EditDataApp extends StatelessWidget {
  const EditDataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TambahDataScreen(),
    );
  }
}

class TambahDataScreen extends StatefulWidget {
  const TambahDataScreen({Key? key}) : super(key: key);

  @override
  _TambahDataScreenState createState() => _TambahDataScreenState();
}

class _TambahDataScreenState extends State<TambahDataScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> dataList = []; // Menyimpan daftar data yang ditambahkan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Data Baru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline, // Menyesuaikan input teks
              textInputAction:
                  TextInputAction.newline, // Menambahkan Enter untuk baris baru
              decoration: const InputDecoration(
                labelText: 'Data Baru',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: const TextStyle(fontSize: 16),
              maxLines: null, // Mengizinkan TextField untuk baris baru
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Cek jika field tidak kosong
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    dataList
                        .add(_controller.text); // Menambahkan data ke daftar
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil ditambahkan!')),
                  );
                  _controller.clear(); // Membersihkan input
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mohon masukkan data')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Lebar tombol penuh
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Tambah Data',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            // Menampilkan daftar data yang sudah ditambahkan
            const Text(
              'Daftar Data yang Sudah Ditambahkan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dataList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/AdminBeranda.dart';

class EditDataApp extends StatelessWidget {
  const EditDataApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EditDataScreen(),
    );
  }
}

class EditDataScreen extends StatelessWidget {
  const EditDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.7; // Tombol dengan lebar 70% dari layar

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DashboardAdmin()));
          },
        ),
        title: const Text(
          'EDIT DATA',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.add_circle_outline,
                  label: 'Tambah Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TambahDataScreen()),
                    );
                  },
                  width: buttonWidth,
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.delete,
                  label: 'Hapus Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HapusDataScreen()),
                    );
                  },
                  width: buttonWidth,
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.view_list,
                  label: 'Lihat Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LihatDataScreen()),
                    );
                  },
                  width: buttonWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class TambahDataScreen extends StatelessWidget {
  const TambahDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tambah Data'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Data Baru'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil ditambahkan!')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Tambah Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HapusDataScreen extends StatelessWidget {
  const HapusDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Hapus Data'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(labelText: 'Data yang akan dihapus'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data berhasil dihapus!')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Hapus Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LihatDataScreen extends StatelessWidget {
  const LihatDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> dataList = ['Data 1', 'Data 2', 'Data 3'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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

import 'package:flutter/material.dart';

void main() => runApp(const PraktikumProfilMhs());

class PraktikumProfilMhs extends StatelessWidget {
  const PraktikumProfilMhs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Profil Mhs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const FormProfil(),
    );
  }
}

class FormProfil extends StatefulWidget {
  const FormProfil({super.key});

  @override
  State<FormProfil> createState() => _FormProfilState();
}

class _FormProfilState extends State<FormProfil> {
  final _namaCtrl = TextEditingController();
  final _nimCtrl = TextEditingController();
  final _prodiCtrl = TextEditingController();
  bool _sudahSimpan = false;

  bool get _valid =>
      _namaCtrl.text.trim().isNotEmpty &&
      _nimCtrl.text.trim().isNotEmpty &&
      _prodiCtrl.text.trim().isNotEmpty;

  void _onInputChanged(String _) {
    setState(() => _sudahSimpan = false);
  }

  void _simpan() {
    setState(() => _sudahSimpan = true);
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _nimCtrl.dispose();
    _prodiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {``
    return Scaffold(
      appBar: AppBar(title: const Text('Form Profil Mahasiswa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Form Profil Mahasiswa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _namaCtrl,
              onChanged: _onInputChanged,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nimCtrl,
              onChanged: _onInputChanged,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _prodiCtrl,
              onChanged: _onInputChanged,
              decoration: const InputDecoration(
                labelText: 'Program Studi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            if (!_valid)
              Text(
                'Lengkapi seluruh kolom sebelum menyimpan.',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ElevatedButton(
              // onPressed null = tombol nonaktif
              onPressed: _valid ? _simpan : null,
              child: const Text('Simpan'),
            ),
            const SizedBox(height: 10),
            if (_sudahSimpan)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profil tersimpan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text('Nama: ${_namaCtrl.text.trim()}'),
                      Text('NIM: ${_nimCtrl.text.trim()}'),
                      Text('Prodi: ${_prodiCtrl.text.trim()}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

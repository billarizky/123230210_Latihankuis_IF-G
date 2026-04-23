import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaksi_provider.dart';
// Pastikan nama file model Anda sesuai (transaksi.dart atau transaksi_model.dart)
import '../models/transaksi_model.dart';

class TambahPage extends StatefulWidget {
  @override
  _TambahPageState createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  final _nominalController = TextEditingController();
  final _judulController = TextEditingController();
  String _tipe = 'Pengeluaran';

  @override
  void dispose() {
    // Menghapus controller dari memori saat widget dihancurkan
    _nominalController.dispose();
    _judulController.dispose();
    super.dispose();
  }

  void _simpan() {
    final String judulInput = _judulController.text.trim();
    final String nominalInput = _nominalController.text.trim();

    // Validasi input nominal
    if (nominalInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nominal tidak boleh kosong!")),
      );
      return;
    }

    // Menggunakan tryParse untuk mencegah crash jika input bukan angka
    final double? nominal = double.tryParse(nominalInput);
    if (nominal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan nominal angka yang valid!")),
      );
      return;
    }

    final String judul = judulInput.isEmpty ? "Tanpa Judul" : judulInput;

    // Memanggil fungsi addTransaksi
    Provider.of<TransaksiProvider>(
      context,
      listen: false,
    ).addTransaksi(judul, nominal, _tipe == 'Pengeluaran');

    // Feedback ke pengguna
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Transaksi Berhasil Disimpan!")),
    );

    // Reset Form
    _nominalController.clear();
    _judulController.clear();
    setState(() {
      _tipe = 'Pengeluaran';
    });

    // Opsional: Jika ingin otomatis kembali ke Dashboard setelah simpan
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Transaksi",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF0D9488),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(
                labelText: "Keterangan / Judul",
                hintText: "Contoh: Beli Makan Siang",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
              textInputAction:
                  TextInputAction.next, // Pindah ke input berikutnya
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nominalController,
              decoration: const InputDecoration(
                labelText: "Nominal (Rp)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
              textInputAction:
                  TextInputAction.done, // Menutup keyboard saat selesai
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _tipe,
              decoration: const InputDecoration(
                labelText: "Tipe Transaksi",
                border: OutlineInputBorder(),
              ),
              items: [
                'Pengeluaran',
                'Pemasukan',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => _tipe = val!),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _simpan,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8F3EF),
                foregroundColor: const Color(0xFF0D9488),
                minimumSize: const Size(double.infinity, 55),
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              child: const Text(
                "Simpan Transaksi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

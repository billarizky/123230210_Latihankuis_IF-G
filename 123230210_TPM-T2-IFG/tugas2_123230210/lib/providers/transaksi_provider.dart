import 'package:flutter/material.dart';
import '../models/transaksi_model.dart';

class TransaksiProvider with ChangeNotifier {
  List<Transaksi> _items = [];

  List<Transaksi> get items => [..._items];

  double get totalSaldo {
    double total = 0; // Saldo awal sesuai gambar
    for (var item in _items) {
      if (item.isPengeluaran) {
        total -= item.nominal;
      } else {
        total += item.nominal;
      }
    }
    return total;
  }

  void addTransaksi(String judul, double nominal, bool isPengeluaran) {
    _items.insert(0, Transaksi(
      id: DateTime.now().toString(),
      judul: judul,
      nominal: nominal,
      tanggal: DateTime.now(),
      isPengeluaran: isPengeluaran, kategori: '', jenis: '',
    ));
    notifyListeners();
  }

  void tambahTransaksi(Transaksi transaksi) {}
}
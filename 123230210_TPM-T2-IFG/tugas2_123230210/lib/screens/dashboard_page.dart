import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Tambahkan package intl di pubspec.yaml
import '../providers/transaksi_provider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data dari TransaksiProvider
    final data = Provider.of<TransaksiProvider>(context);

    // Formatter untuk mengubah angka ke format Rupiah
    final currencyFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color(0xFF0D9488),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Card Saldo (Sesuai Screenshot)
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFF0D9488), // Warna hijau toska sesuai gambar
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text(
                  "Total Saldo",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  currencyFormat.format(data.totalSaldo),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Ganti bagian Riwayat Terakhir yang sebelumnya dengan ini:
          SizedBox(height: 5),
          Center(
            // <--- Bungkus dengan Center
            child: Text(
              "Riwayat Terakhir",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: data.items.isEmpty
                ? const Center(child: Text("Belum ada transaksi"))
                : ListView.builder(
                    itemCount: data.items.length,
                    itemBuilder: (context, i) {
                      final item = data.items[i];
                      return ListTile(
                        leading: const Icon(
                          Icons.shopping_cart,
                          color: Colors.red,
                        ),
                        title: Text(item.judul),
                        subtitle: Text(
                          DateFormat('dd MMMM yyyy').format(item.tanggal),
                        ),
                        trailing: Text(
                          "- ${currencyFormat.format(item.nominal)}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Anda bisa menambahkan ListView singkat di sini nanti
        ],
      ),
    );
  }
}

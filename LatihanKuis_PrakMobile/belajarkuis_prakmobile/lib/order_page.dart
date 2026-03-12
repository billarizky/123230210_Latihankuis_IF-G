import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {

  final String nama;
  final int harga;
  final String gambar;

  const OrderPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.gambar,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int jumlah = 0;
  int total = 0;

  void hitungTotal(String value) {
    setState(() {
      jumlah = int.tryParse(value) ?? 0;
      total = jumlah * widget.harga;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Order Makanan"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Gambar makanan
            Image.asset(
              widget.gambar,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            /// Nama makanan
            Text(
              widget.nama,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// Harga
            Text(
              "Harga: Rp ${widget.harga}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            /// Input jumlah pesanan
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Jumlah Pesanan",
                border: OutlineInputBorder(),
              ),
              onChanged: hitungTotal,
            ),

            const SizedBox(height: 20),

            /// Total harga
            Text(
              "Total Harga: Rp $total",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 30),

            /// Tombol pesan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),

                onPressed: () {

                  if (jumlah > 0) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Pesanan ${widget.nama} Berhasil Dipesan",
                        ),
                      ),
                    );

                  } else {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Masukkan jumlah pesanan terlebih dahulu"),
                      ),
                    );

                  }

                },

                child: const Text(
                  "Pesan Sekarang",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

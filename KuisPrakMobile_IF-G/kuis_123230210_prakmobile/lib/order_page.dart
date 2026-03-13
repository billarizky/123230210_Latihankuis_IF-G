import 'package:flutter/material.dart';
import 'listmenu.dart';

class OrderPage extends StatefulWidget {
  final Menu menu;

  const OrderPage({super.key, required this.menu});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    int total = jumlah * widget.menu.harga;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order "),
        backgroundColor: Colors.green,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset("aset/piring.jpg", height: 120),

            const SizedBox(height: 10),

            Text(
              widget.menu.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text("Harga : Rp ${widget.menu.harga}"),

            const SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Jumlah"),

              onChanged: (value) {
                setState(() {
                  jumlah = int.tryParse(value) ?? 1;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              "Total Harga : Rp $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

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
                          "Pesanan ${widget.menu.nama} Berhasil Dipesan",
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

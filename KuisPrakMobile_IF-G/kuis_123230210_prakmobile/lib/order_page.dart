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
      appBar: AppBar(title: const Text("Order")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset(widget.menu.gambar, height: 120),

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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage(this.username, {super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> menu = [
      {
        "nama": "Nasi Goreng",
        "harga": 15000,
        "gambar": "aset/Nasi-Goreng-telor.jpg",
      },
      {
        "nama": "Mie Ayam",
        "harga": 12000,
        "gambar": "aset/download.jpg",
      },
      {
        "nama": "Sate Ayam",
        "harga": 20000,
        "gambar": "aset/download (3).jpg",
      },
      {
        "nama": "Bakso",
        "harga": 10000,
        "gambar": "aset/download (4).jpg",
      },
      {
        "nama": "Soto Ayam",
        "harga": 14000,
        "gambar": "aset/download (5).jpg",
      },
      {
        "nama": "Gado-Gado",
        "harga": 13000,
        "gambar": "aset/download (6).jpg",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Halo @$username", style: const TextStyle(fontSize: 16)),
            const Text(
              "Mau Makan Apa Hari Ini?",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),

        /// TOMBOL LOGOUT
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),

            onPressed: () {

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
                (route) => false,
              );

            },
          ),
        ],
      ),

      body: Column(
        children: [

          /// Banner
          Image.asset(
            "aset/download (2).jpg",
            width: double.infinity,
            height: 170,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 10),

          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),

              itemCount: menu.length,

              itemBuilder: (context, index) {

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  elevation: 5,

                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Column(
                      children: [

                        Expanded(
                          child: Image.asset(
                            menu[index]["gambar"],
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          menu[index]["nama"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Text(
                          "Rp ${menu[index]["harga"]}",
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 8),

                        SizedBox(
                          width: 90,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(
                                    nama: menu[index]["nama"],
                                    harga: menu[index]["harga"],
                                    gambar: menu[index]["gambar"],
                                  ),
                                ),
                              );

                            },

                            child: const Text("Pesan"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



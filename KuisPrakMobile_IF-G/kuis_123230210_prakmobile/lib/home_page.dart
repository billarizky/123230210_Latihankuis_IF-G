import 'package:flutter/material.dart';
import 'listmenu.dart';
import 'order_page.dart';
import 'package:kuis_123230210_prakmobile/home_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage(String text, {super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const SizedBox(height: 10),

            Text(
              "Selamat Datang, $username!",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const Text(
                "Klik untuk ke halaman About",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Daftar Menu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: listMenu.length,
                itemBuilder: (context, index) {
                  final menu = listMenu[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10),

                      child: Row(
                        children: [
                          Image.asset(menu.gambar, width: 70),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                Text(
                                  "Rp ${menu.harga}",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const StadiumBorder(),
                            ),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(menu: menu),
                                ),
                              );
                            },

                            child: const Text("Pesan"),
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
      ),
    );
  }
}

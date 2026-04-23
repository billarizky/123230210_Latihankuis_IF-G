import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transaksi_provider.dart';
import 'screens/dashboard_page.dart';
import 'screens/tambah_transaksi_page.dart';
import 'screens/kurs_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransaksiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF1F8F5),
          primaryColor: const Color(0xFF0D9488),
        ),
        home: MainNavigation(),
      ),
    ),
  );
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Daftar halaman untuk navigasi
  final List<Widget> _pages = [
    DashboardPage(),
    TambahPage(),
    KursPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFF0D9488),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Tambah'),
          BottomNavigationBarItem(icon: Icon(Icons.currency_exchange), label: 'Kurs API'),
        ],
      ),
    );
  }
}
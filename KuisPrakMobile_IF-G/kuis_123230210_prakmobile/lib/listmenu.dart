class Menu {
  final String nama;
  final int harga;
  final String gambar;

  Menu({required this.nama, required this.harga, required this.gambar});
}

List<Menu> listMenu = [
  Menu(nama: "Nasi Goreng", harga: 15000, gambar: "assets/piring.png"),
  Menu(nama: "Mie Ayam", harga: 12000, gambar: "assets/piring.png"),
  Menu(nama: "Sate Ayam", harga: 20000, gambar: "assets/piring.png"),
  Menu(nama: "Bakso", harga: 10000, gambar: "assets/piring.png"),
  Menu(nama: "Soto Ayam", harga: 13000, gambar: "assets/piring.png"),
  Menu(nama: "Gado-Gado", harga: 14000, gambar: "assets/piring.png"),
];

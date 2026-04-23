class Transaksi {
  final String id;
  final String judul;
  final double nominal;
  final DateTime tanggal;
  final bool isPengeluaran;

  Transaksi({
    required this.id,
    required this.judul,
    required this.nominal,
    required this.tanggal,
    this.isPengeluaran = true, required String kategori, required String jenis,
  });
}

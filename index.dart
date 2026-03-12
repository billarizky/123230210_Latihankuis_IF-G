
class User {
  final String _nama;
  final int umur;

  String get nama => _nama;

  User(this._nama, this.umur);

  Future<void> fungsiAsinkron() async {

  }
}

void main() {
  // Tipe Data
  int angka = 10;
  String nama = "Wijdan";
  double angkaKoma = 10.1;
  List<String> array = ["Halo", "Dunia"];

  // JSON (Javascript object notation)
  Map<String, dynamic> json = {
    "nama": "Alfin",
    "prodi": "Sistem Informasi",
    "umur": 17,
    "alamat": {"nomor_rumah": 90}
  };

  List<Map<String, dynamic>> users = [
    {
      "nama": "Alfin",
      "prodi": "Sistem Informasi",
      "umur": 17,
      "alamat": {"nomor_rumah": 90}
    },
    {
      "nama": "Wijdan",
      "prodi": "Informatika",
      "umur": 21,
      "alamat": {"nomor_rumah": 90}
    },
  ];

  for (var user in users) {
    print(user["nama"]);
  }

}
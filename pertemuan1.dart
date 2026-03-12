import 'sebuah_class.dart'; // Import dari file lain

void main(){
  // 1. Tipe data
  String nama = "Alfin";
  int umur = 21;
  double ipk = 3.99;
  bool sehat = true;

  // 2. Tipe data (Collection)
  List hobbies = ["Gaming", "Tidur"]; // Seperti array bisa juga diberi tipe untuk List nya, ex: List<String> 
  Set angka = {1, 2, 3, 4, 4}; // Set ini seperti array tapi isinya itu unik, ketika diprint angka yg duplikat akan muncul sekali.
  Map<String, dynamic> user = { // Map mirip seperti tipe JSON yaitu pasangan key - value
    "nama" : "Alfin",
    "umur" : 21
  };

  print(hobbies[0]);
  print(angka);
  print(user['nama']);

  // 3. Variabel
  var greeting = "Halo!";
  const pi = 3.14; // tidak bisa diubah - nilai tetap saat compile-time
  final nilai = 90; // nilai tetap saat runtime

  // 4. Null safety
  String? pekerjaan = "Polisi"; // contohnya seperti ini

  print(pekerjaan); // ini tetap bisa diprint, nanti akan mengoutput nilai "null"

  // 5. Pengkondisian
  if(true) {
    print("Benar");
  }

  switch(nilai){
    case > 85 : print("Nilai A!!"); break;
    case > 80 : print("Nilai B!!"); break;
  }

  // 6. Perulangan
  for(int i = 0; i < 5; i++){
    print("Aku suka ngoding ${i + 1}");
  }

  for (var hobby in hobbies) { // untuk array
    print(hobby);
  }

  while(sehat){
    print("Saya sehat");
    sehat = false;
  }

  // 7. Fungsi 
  fungsiVoid();
  greet("Wijdan");
  print(tambah(2, 2));
  buatDataDiri(nama: "Alfin", umur: 21, alamat: "Jl. Babarsari");

  // 8. Class & Object
  var sebuahObjek = SebuahClass("Alfin", "Jl. Babarsari", 124230021); // Instansiasi
  print(sebuahObjek.nama); // akses field obyek
  sebuahObjek.sayHello(); // akses method obyek
  print(sebuahObjek.nim); // cara menggunakan getter (nim merupakan private field)

}

// fungsi void
void fungsiVoid(){
  print("Halo");
}

// fungsi dengan parameter
void greet(String nama){
  print("Halo, $nama");
}

// fungsi dengan kembalian
int tambah(int angka1, int angka2){
  return angka1 + angka2;
}

// fungsi dengan named parameter
void buatDataDiri({ required String nama, String? alamat, int? umur }){
  print("Nama: $nama");
  print("Alamat: $alamat");
  print("Umur: $umur");
}
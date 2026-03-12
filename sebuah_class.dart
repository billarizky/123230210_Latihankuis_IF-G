/*
  Masih banyak lagi seperti abstraction dan inheritance. 
  Syntax-syntax itu bisa dipelajari mandiri, hampir mirip dengan kalian belajar di Java atau Cpp untuk OOP.
 */

class SebuahClass {
  String nama;
  String alamat;
  int _nim; // private field

  int get nim => _nim; // getter (Bisa juga kalau mau getternya dengan method)

  //1. parameterized constructor (Recommended)
  SebuahClass(this.nama, this.alamat, this._nim);

  //2. named parameter constructor
  // SebuahClass({
  //   required this.nama,
  //   required this.alamat,
  //   required nim
  // }) : _nim = nim;

  //3. named constructor
  SebuahClass.mahasiswaUpn(String nama, String alamat, int nim) : nama = nama, alamat = alamat, _nim = nim;

  // Method
  void sayHello(){
    print("Halo saya, ${this.nama}");
  }
}
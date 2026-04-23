import 'package:flutter/material.dart';

class KursPage extends StatefulWidget {
  @override
  _KursPageState createState() => _KursPageState();
}

class _KursPageState extends State<KursPage> {
  final _amountController = TextEditingController();
  String _selectedCurrency = 'USD';
  double _result = 0.0;

  // Nilai kurs statis (Anda bisa menggantinya dengan pemanggilan API nyata nanti)
  final Map<String, double> _exchangeRates = {
    'USD': 16000.0,
    'EUR': 17200.0,
    'JPY': 105.0,
  };

  void _convert() {
    if (_amountController.text.isEmpty) return;

    double inputAmount = double.parse(_amountController.text);
    double rate = _exchangeRates[_selectedCurrency] ?? 1.0;

    setState(() {
      _result = inputAmount / rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Konversi Mata Uang",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF0D9488),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Input Jumlah Rupiah (IDR)
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                hintText: "Jumlah Rupiah (IDR)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Dropdown Pilih Mata Uang
            DropdownButtonFormField<String>(
              value: _selectedCurrency,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: _exchangeRates.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
            ),
            SizedBox(height: 30),

            // Tombol Konversi
            ElevatedButton(
              onPressed: _convert,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                  0xFFE8F3EF,
                ), // Warna latar tombol sesuai gambar
                foregroundColor: Color(0xFF0D9488), // Warna teks tombol
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: Text(
                "Konversi Sekarang",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 50),

            // Tampilan Hasil Konversi
            Text(
              "Hasil Konversi:",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              "${_result.toStringAsFixed(2)} $_selectedCurrency",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D9488), // Warna hijau sesuai screenshot hasil
              ),
            ),
          ],
        ),
      ),
    );
  }
}

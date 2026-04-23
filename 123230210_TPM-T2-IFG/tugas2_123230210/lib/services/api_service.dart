import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<double> fetchExchangeRate(String toCurrency) async {
    final response = await http.get(
      Uri.parse('https://api.frankfurter.app/latest?from=IDR&to=$toCurrency'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates'][toCurrency];
    } else {
      throw Exception('Gagal mengambil data kurs');
    }
  }
}

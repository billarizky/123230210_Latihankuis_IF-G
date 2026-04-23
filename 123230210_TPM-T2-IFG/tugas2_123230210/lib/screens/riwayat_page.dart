import 'package:flutter/material.dart';
import '../providers/transaksi_provider.dart';

class RiwayatPage extends StatelessWidget {
  get Provider => null;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TransaksiProvider>(context).semuaTransaksi;

    return Scaffold(
      appBar: AppBar(title: Text("Riwayat")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var trx = data[index];
          return ListTile(
            title: Text(trx.kategori),
            subtitle: Text(trx.jenis),
            trailing: Text(trx.nominal.toString()),
          );
        },
      ),
    );
  }
}
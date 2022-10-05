// ignore_for_file: prefer_const_constructors

import 'package:covid_app_project/models/data_covid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class DetailProvinsi extends StatelessWidget {
  DetailProvinsi({Key? key, required this.provinsi}) : super(key: key);
  DataCovid provinsi;

  final formatter = intl.NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(provinsi.key!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text("Provinsi"),
            SizedBox(
              height: 5,
            ),
            Text(
              provinsi.key!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RowGrid(
              jumlahKasus1: formatter.format(provinsi.jumlahKasus),
              jumlahKasus2: formatter.format(provinsi.jumlahSembuh),
              namaKasus1: "Jumlah Kasus",
              namaKasus2: "Jumlah Sembuh",
              color1: Colors.red,
              color2: Colors.green,
            ),
            RowGrid(
              jumlahKasus1: formatter.format(provinsi.jumlahMeninggal),
              jumlahKasus2: formatter.format(provinsi.jumlahDirawat),
              namaKasus1: "Jumlah Meninggal",
              namaKasus2: "Jumlah Dirawat",
              color1: Colors.orange,
              color2: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Kelompok Umur",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: provinsi.kelompokUmur!.map(
                (data) {
                  return Card(
                    child: ListTile(
                      title: Text('${data['key']} Tahun'),
                      trailing: Text(
                        formatter.format(data['doc_count']),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: provinsi.jenisKelamin!.map(
                (data) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        data['key'],
                      ),
                      trailing: Text(
                        formatter.format(data['doc_count']),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class RowGrid extends StatelessWidget {
  RowGrid(
      {Key? key,
      required this.jumlahKasus2,
      required this.jumlahKasus1,
      required this.namaKasus1,
      required this.namaKasus2,
      required this.color1,
      required this.color2})
      : super(key: key);
  String jumlahKasus1;
  String jumlahKasus2;
  String namaKasus1;
  String namaKasus2;
  Color color1;
  Color color2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Column(
                children: [
                  Text(
                    jumlahKasus1,
                    style: TextStyle(
                      fontSize: 25,
                      color: color1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(namaKasus1),
                ],
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: Card(
        //     child: Container(
        //       alignment: Alignment.center,
        //       padding: EdgeInsets.symmetric(
        //         vertical: 50,
        //       ),
        //       child: Text(
        //         provinsi.jumlahSembuh.toString(),
        //       ),
        //     ),
        //   ),
        // ),

        Expanded(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Column(
                children: [
                  Text(
                    jumlahKasus2,
                    style: TextStyle(
                      fontSize: 25,
                      color: color2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(namaKasus2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

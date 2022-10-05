// ignore_for_file: prefer_const_constructors

import 'package:covid_app_project/models/data_covid.dart';
import 'package:flutter/material.dart';

class DetailProvinsi extends StatelessWidget {
  DetailProvinsi({Key? key, required this.provinsi}) : super(key: key);
  DataCovid provinsi;

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
              jumlahKasus1: provinsi.jumlahKasus.toString(),
              jumlahKasus2: provinsi.jumlahSembuh.toString(),
              namaKasus1: "Jumlah Kasus",
              namaKasus2: "Jumlah Sembuh",
              color1: Colors.red,
              color2: Colors.green,
            ),
            RowGrid(
              jumlahKasus1: provinsi.jumlahMeninggal.toString(),
              jumlahKasus2: provinsi.jumlahDirawat.toString(),
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
              children: provinsi.kelompokUmur!.map((data) {
                return Card(
                  child: ListTile(
                    title: Text('${data['key']} Tahun'),
                    trailing: Text(
                      data['doc_count'].toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
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

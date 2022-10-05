import 'package:covid_app_project/models/data_covid.dart';
import 'package:covid_app_project/screen/detail_provonsi.dart';
import 'package:flutter/material.dart';

class ProvinsiItem extends StatelessWidget {
  ProvinsiItem({Key? key, required this.dataprovinsi}) : super(key: key);

  DataCovid dataprovinsi;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProvinsi(
              provinsi: dataprovinsi,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataprovinsi.key!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Jumlah Kasus"),
            SizedBox(
              height: 5,
            ),
            Text(
              dataprovinsi.jumlahKasus.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

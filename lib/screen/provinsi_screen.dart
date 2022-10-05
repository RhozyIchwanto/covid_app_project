// ignore_for_file: prefer_const_constructors

import 'package:covid_app_project/provider/data.dart';
import 'package:covid_app_project/widget/provinsi_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvinsiScreen extends StatelessWidget {
  const ProvinsiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Data dataCovid = Provider.of<Data>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Covid App"),
      ),
      body: FutureBuilder(
        future: dataCovid.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 5 / 3),
                itemCount: dataCovid.dataProvinsi.length,
                itemBuilder: (context, index) {
                  final data = dataCovid.dataProvinsi[index];
                  // return ListTile(
                  //   title: Text(data.key!),
                  //   subtitle: Text(data.jumlahKasus.toString()),
                  return ProvinsiItem(
                    dataprovinsi: data,
                  );
                  // );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

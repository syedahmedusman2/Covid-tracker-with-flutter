import 'dart:convert';

import 'package:covid/pages/searchdelegate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List countryData = [];

  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.https("corona.lmao.ninja", "v3/covid-19/countries"));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // fetchWorldData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Country Wise Data"),
          backgroundColor: Colors.black38,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Searchs(countryData));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: countryData.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.black,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.26,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      countryData[index]['country'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Image.network(
                                    countryData[index]['countryInfo']['flag'],
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Confirmed Cases : " +
                                          countryData[index]['cases']
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Active Cases : " +
                                          countryData[index]['active']
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Recovered Cases : " +
                                          countryData[index]['recovered']
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Deaths : " +
                                          countryData[index]['deaths']
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }));
  }
}

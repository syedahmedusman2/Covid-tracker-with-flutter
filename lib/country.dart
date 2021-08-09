import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Countries extends StatefulWidget {
  const Countries({ Key? key }) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}



class _CountriesState extends State<Countries> {

  
 List countryData =[];

  fetchCountryData()async{
    http.Response response = await http.get(Uri.https("corona.lmao.ninja", "v3/covid-19/countries"));
    setState(() {
      countryData =json.decode(response.body);
    });
   
  }

  @override
void initState(){
  // fetchWorldData();
  fetchCountryData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Country Wise Data"), backgroundColor: Colors.black38,),

      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemBuilder: (context, index){
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                   height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(countryData[index]['country'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ),
                      Image.network(countryData[index]['countryInfo']['flag'],
                      height: 70,
                    width: 80,)
                    ],
                  ),

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Confirmed Cases : "+countryData[index]['cases'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Active Cases : "+countryData[index]['active'].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900] ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Recovered Cases : "+countryData[index]['recovered'].toString(),  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[700] ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Deaths : "+countryData[index]['deaths'].toString(),  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700] ),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          })
      
    );
  }
}
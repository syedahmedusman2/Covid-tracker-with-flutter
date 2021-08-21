import 'dart:convert';
import 'dart:html';
import 'package:covid/country.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid/datasource.dart';
import 'package:covid/faq.dart';
import 'package:covid/mostaffectedcountries.dart';
import 'package:covid/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Homepage extends StatefulWidget {
  

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData = {};

  fetchWorldData()async{
    http.Response response = await http.get(Uri.https("corona.lmao.ninja", "v3/covid-19/all"));
    setState(() {
      worldData = json.decode(response.body);
    });
   
  }

 List countryData =[];

  fetchCountryData()async{
    http.Response response = await http.get(Uri.https("corona.lmao.ninja", "v3/covid-19/countries"));
    setState(() {
      countryData = json.decode(response.body);
    });
   
  }

  @override
void initState(){
  fetchWorldData();
  fetchCountryData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Covid Tracker App")),
      backgroundColor: Colors.black26,
      // actions: [
      //   IconButton(onPressed: (){
      //     DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.dark);

      //   }, icon: Icon(Theme.of(context).brightness == Brightness.light?Icons.lightbulb:Icons.highlight) )
      // ],
      ),

      body: SingleChildScrollView(child: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 1.0,
            color: Colors.orange[100],
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(Datasource.quote, style: TextStyle(color: Colors.orange[800],
              fontWeight: FontWeight.bold,
              fontSize: 21),),
            ), 
          ),

          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("WorldWide", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Countries()));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.black38,
                  borderRadius: BorderRadius.circular(16)
                  ),
                  
                  child: Text("Regional",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17), )),
              ),
            ],
          ),

          

         worldData == null
                ? CircularProgressIndicator()
                : Panel(
                    worldData: worldData,
                  ),

        // countryData == null
        //         ? Container()
        //         : MostAffectedPanel(countryData: countryData)

                countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),

                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq()));
                    },
                    child: Container(
                      height: 41,
                      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Row(   
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
                          children: [
                            Text("FAQs",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Icon(Icons.arrow_forward)
                  
                  
                  
                          ],
                        ),
                      ),
                    ),
                  ),

                 GestureDetector(
                   onTap: () {
              launch('https://covid19responsefund.org/');
            },
                    child: Container(
                      height: 41,
                      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Row(   
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
                          children: [
                            Text("Donations",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Icon(Icons.arrow_forward)
                  
                  
                  
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
                    child: Container(
                      height: 41,
                      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Row(   
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
                          children: [
                            Text("Myth Busters",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Icon(Icons.arrow_forward)
                  
                  
                  
                          ],
                        ),
                      ),
                    ),
                  ),

                  
                   
                  

        ],
      ),),
      
    );
  }
}
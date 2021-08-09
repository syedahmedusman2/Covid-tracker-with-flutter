import 'package:flutter/material.dart';


// class Panel extends StatefulWidget {
//   final Map worldData;
//     const Panel({ Key? key, required this.worldData}) : super(key: key);
    


//   @override
//   _PanelState createState() => _PanelState();
// }

// class _PanelState extends State<Panel> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
//       shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//       children:<Widget> [
//         StatusPanel(
//             title: 'CONFIRMED',
//             panelColor: Colors.red[100]!,
//             textColor: Colors.red,
//             count: worldDa,
//           ),
//          StatusPanel(
//            title: 'ACTIVE',
//             panelColor: Colors.blue[100]!,
//             textColor: Colors.blue[900]!,
//             count: "222",
//          ),
//           StatusPanel(
//              title: 'RECOVERED',
//             panelColor: Colors.green[100]!,
//             textColor: Colors.green,
//             count: "worldData['recovered'].toString()",
//           ),
//            StatusPanel(
//              title: 'DEATHS',
//             panelColor: Colors.grey[400]!,
//             textColor: Colors.grey[900]!,
//             count: worldData['deaths'].toString(),
          
//            )
        
//       ],),
//     );
      
    
//   }
// }

class Panel extends StatelessWidget {
    final Map worldData;

  const Panel({ required this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100]!,
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100]!,
            textColor: Colors.blue[900]!,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100]!,
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey[400]!,
            textColor: Colors.grey[900]!,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
      
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      { required this.panelColor,required this.textColor, required this.title,required this.count})
      ;
 
  @override

  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    return Container(
      color:panelColor,
      height: 80,width: width/2,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(child: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: textColor),)),
          ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
             child: Center(child: Text(count, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  color: textColor),)),
           )
        ],
      ),
      
    );
  }
}



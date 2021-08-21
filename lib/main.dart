import 'package:covid/homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
// import 'package:dynamic_themes/dynamic_themes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  return DynamicTheme(
  //    data: (brightness){
  //      return ThemeData(
  //        brightness: brightness == Brightness.dark?Brightness.light:Brightness.dark,
  //        scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white
  //      );
  //    },

  //    themedWidgetBuilder: (context, theme){
       return MaterialApp(
      debugShowCheckedModeBanner: false, 
      // theme: theme,
      home: Homepage(),
     );
    //  },
    
  //  );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DynamicTheme(
//       data: (brightness) {
//         return ThemeData(
//             // primaryColor: primaryBlack,
//             // fontFamily: 'Circular',
//             brightness: brightness == Brightness.light
//                 ? Brightness.light
//                 : Brightness.dark,
//             scaffoldBackgroundColor: brightness == Brightness.dark
//                 ? Colors.blueGrey[900]
//                 : Colors.white);
//       },
//       themedWidgetBuilder: (context, theme) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: theme,
//           home: Homepage(),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:socionic_tools/aspectCalulationPage.dart';
import 'package:socionic_tools/quadratesPage.dart';
import 'package:socionic_tools/relationsPage.dart';
import 'package:socionic_tools/typesPage.dart';

void main() => runApp(MySocionicApp());

class MySocionicApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socionic tools',
      theme: ThemeData.dark(),
//      ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the dcounter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        backgroundColor: Colors.blue,
//        scaffoldBackgroundColor: Colors.blueAccent,
//      ),
      initialRoute: TypesPage.routeName,
      routes: {
        TypesPage.routeName: (BuildContext context) => TypesPage(),
        RelationsPage.routeName: (BuildContext context) => RelationsPage(),
        QuadratesPage.routeName: (BuildContext context) => QuadratesPage(),
        AspectCalculationPage.routeName: (BuildContext context) =>
            AspectCalculationPage(),
      },
    );
  }
}

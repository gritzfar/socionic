import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:socionic_tools/aspectCalulationPage.dart';
import 'package:socionic_tools/aspectsPage.dart';
import 'package:socionic_tools/quadratesPage.dart';
import 'package:socionic_tools/relationsPage.dart';
import 'package:socionic_tools/typesPage.dart';

final bool app_IsInTest = true;

//Test id
final String appId = "ca-app-pub-3940256099942544~3347511713";

// Orig id
//final String appId = "ca-app-pub-7993607976861905~7718564880";

String getBannerAdUnitId(){
  //Test banner
  return "ca-app-pub-3940256099942544/6300978111";

  // Orig banner id
  //return "ca-app-pub-7993607976861905/6677424882";
}

String getAppId(){
  return "ca-app-pub-7993607976861905~7718564880";
}

void main() => runApp(MySocionicApp());

class MySocionicApp extends StatefulWidget  {
  const MySocionicApp({Key key}) : super(key: key);

  @override
  _MySocionicAppState createState() => _MySocionicAppState();
}

class _MySocionicAppState extends State<MySocionicApp> {

  @override
  void initState() {
    super.initState();

    Admob.initialize(appId);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Socionic tools',
      theme: ThemeData.dark(),
      initialRoute: TypesPage.routeName,
      routes: {
        TypesPage.routeName: (BuildContext context) => TypesPage(),
        RelationsPage.routeName: (BuildContext context) => RelationsPage(),
        QuadratesPage.routeName: (BuildContext context) => QuadratesPage(),
        AspectCalculationPage.routeName: (BuildContext context) => AspectCalculationPage(),
        AspectsPage.routeName: (BuildContext context) => AspectsPage(),
      },
    );
  }
}

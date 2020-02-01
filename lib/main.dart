//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:socionic_tools/appConfig.dart';
import 'package:socionic_tools/aspectCalulationPage.dart';
import 'package:socionic_tools/aspectsPage.dart';
import 'package:socionic_tools/quadratesPage.dart';
import 'package:socionic_tools/relationsPage.dart';
import 'package:socionic_tools/typesPage.dart';

//void main() => runApp(MySocionicApp());

void main() {
  var configuredApp = AppConfig(
    hasAdds: false,
    child: MySocionicApp(),
  );

  WidgetsFlutterBinding.ensureInitialized();

  //mainCommon(configuredApp);

  runApp(configuredApp);
}

class MySocionicApp extends StatefulWidget  {
  const MySocionicApp({Key key}) : super(key: key);

  @override
  _MySocionicAppState createState() => _MySocionicAppState();
}

class _MySocionicAppState extends State<MySocionicApp> {

//  @override
//  void initState() {
//    super.initState();
//    var config = AppConfig.of(context);
//
//    config.initAdds();
//  }

  @override
  Widget build(BuildContext context) {

    var config = AppConfig.of(context);
    var hasAdds = config.hasAdds;
    var title = "Socionic tools" + (hasAdds ? "(free)" : "");

    config.initAdds();

    return MaterialApp(
      title: title,
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

Widget getBanner(BuildContext context) {
  var config = AppConfig.of(context);
  if (!config.hasAdds) {
    return null;
  }

  return null;
//  return
//    Padding(
//        padding: EdgeInsets.only(top: 8.0),
//        //child: ClipRRect(
//        // rounded corners ad.
//        //borderRadius: BorderRadius.circular(40.0),
//        child:
//        AdmobBanner(
//          adUnitId: config.getBannerAdUnitId(),
//          adSize: AdmobBannerSize.BANNER,
//        )
//    );
  //));
}

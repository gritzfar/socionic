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
    testAdds: false,
    child: MySocionicApp(),
  );

  //WidgetsFlutterBinding.ensureInitialized();

  //mainCommon(configuredApp);

  runApp(configuredApp);
}

Widget getBanner(BuildContext context) {
  return null;
}

class MySocionicApp extends StatefulWidget {
  const MySocionicApp({Key key}) : super(key: key);

  @override
  _MySocionicAppState createState() => _MySocionicAppState();
}

class _MySocionicAppState extends State<MySocionicApp> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    var hasAdds = config.hasAdds;
    var title = "Моя соционика" + (hasAdds ? " (free)" : "");

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

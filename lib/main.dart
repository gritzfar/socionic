import 'package:flutter/material.dart';

import 'aspectCalulationPage.dart';
import 'aspectsPage.dart';
import 'quadratesPage.dart';
import 'relationsPage.dart';
import 'typesPage.dart';

void main() => runApp(MySocionicApp());

//void main() {
//  var configuredApp = AppConfig(
//    hasAdds: false,
//    testAdds: false,
//    child: MySocionicApp(),
//  );
//
//  //WidgetsFlutterBinding.ensureInitialized();
//
//  //mainCommon(configuredApp);
//
//  runApp(configuredApp);
//}

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
    //var config = AppConfig.of(context);
    //var hasAdds = config.hasAdds;
    //var title = AppLocalizations.of(context).translate(hasAdds ? "app_name_free" : "app_name");

    return MaterialApp(
      title: "Моя соционика",
      theme: ThemeData.dark(),
//      supportedLocales: [
//        Locale('ru', 'RU'),
//        //Locale('de', 'DE'),
//        //Locale('de', 'US'),
//      ],
//      localizationsDelegates: [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
//      localeResolutionCallback: (locale, supportedLocals) {
//        for (var supportedLocale in supportedLocals) {
//          if (supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
//            return supportedLocale;
//          }
//        }
//
//        return supportedLocals.first;
//      },
      initialRoute: TypesPage.routeName,
      routes: {
        TypesPage.routeName: (BuildContext context) => TypesPage(),
        RelationsPage.routeName: (BuildContext context) => RelationsPage(),
        QuadratesPage.routeName: (BuildContext context) => QuadratesPage(),
        AspectCalculationPage.routeName: (BuildContext context) => AspectCalculationPage(),
        AspectsPage.routeName: (BuildContext context) => AspectsPage(),
        AspectDictionariesPage.routeName: (BuildContext context) => AspectDictionariesPage(),
      },
    );
  }
}

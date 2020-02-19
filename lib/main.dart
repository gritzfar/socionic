import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import 'appConfig.dart';
import 'aspectCalulationPage.dart';
import 'aspectsPage.dart';
import 'quadratesPage.dart';
import 'relationsPage.dart';
import 'typesPage.dart';

void main() {
  var configuredApp = AppConfig(
    internal: true,
    testAdds: false,
    hasAdds: true,
    child: MySocionicApp(),
  );

  WidgetsFlutterBinding.ensureInitialized();

  //init adds
  Admob.initialize(getAppId(false));

  runApp(configuredApp);
}

String getAppId(bool testAdds) {
  if (testAdds) {
    //Test appId
    return "ca-app-pub-3940256099942544~3347511713";
  }

  // Orig app id
  return "ca-app-pub-7993607976861905~7718564880";
}

String getBannerAdUnitId(bool testAdds) {
  if (testAdds) {
    //Test banner
    return "ca-app-pub-3940256099942544/6300978111";
  }

  // Orig banner id
  return "ca-app-pub-7993607976861905/6677424882";
}

Widget getBanner(BuildContext context) {
  if (!AppConfig.of(context).hasAdds) return null;

  return Padding(
      padding: EdgeInsets.only(top: 8.0),
//child: ClipRRect(
// rounded corners ad.
//borderRadius: BorderRadius.circular(40.0),
      child: AdmobBanner(
        adUnitId: getBannerAdUnitId(AppConfig.of(context).testAdds),
        adSize: AdmobBannerSize.BANNER,
      ));
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

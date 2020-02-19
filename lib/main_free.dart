////import 'package:admob_flutter/admob_flutter.dart';
//import 'package:flutter/material.dart';
//import 'package:socionic_tools/appConfig.dart';
//import 'package:socionic_tools/main.dart';
//
//void main() {
//  var configuredApp = AppConfig(
//    hasAdds: true,
//    testAdds: true,
//    child: MySocionicApp(),
//  );
//
//  //init adds
//  //Admob.initialize(configuredApp.getAppId());
//
//  //WidgetsFlutterBinding.ensureInitialized();
//
//  //mainCommon(configuredApp);
//
//  runApp(configuredApp);
//}
//
//Widget getBanner(BuildContext context) {
//  var config = AppConfig.of(context);
//  if (!config.hasAdds) {
//    return null;
//  }
//
//  return null;
//
////  return Padding(
////      padding: EdgeInsets.only(top: 8.0),
////      //child: ClipRRect(
////      // rounded corners ad.
////      //borderRadius: BorderRadius.circular(40.0),
////      child: AdmobBanner(
////        adUnitId: config.getBannerAdUnitId(),
////        adSize: AdmobBannerSize.BANNER,
////      ));
//}

import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  final bool hasAds;
  final bool testAds;
  final bool internal;

  AppConfig({this.internal, this.testAds, this.hasAds, Widget child}) : super(child: child);

//  String getAppId() {
//    if (testAdds) {
//      //Test appId
//      return "ca-app-pub-3940256099942544~3347511713";
//    }
//
//    // Orig app id
//    return "ca-app-pub-7993607976861905~7718564880";
//  }
//
//  String getBannerAdUnitId() {
//    if (testAdds) {
//      //Test banner
//      return "ca-app-pub-3940256099942544/6300978111";
//    }
//
//    // Orig banner id
//    return "ca-app-pub-7993607976861905/6677424882";
//  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

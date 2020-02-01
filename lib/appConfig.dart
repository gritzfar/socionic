//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  final bool hasAdds;
  final bool testAdds;

  AppConfig({this.hasAdds, this.testAdds, Widget child}) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  String getAppId() {
    if (testAdds) {
      //Test appId
      return "ca-app-pub-3940256099942544~3347511713";
    }

    // Orig app id
    return "ca-app-pub-7993607976861905~7718564880";
  }

  String getBannerAdUnitId() {
    if (testAdds) {
      //Test banner
      return "ca-app-pub-3940256099942544/6300978111";
    }

    // Orig banner id
    return "ca-app-pub-7993607976861905/6677424882";
  }

  void initAdds() {
    if (this.hasAdds) {
      //Admob.initialize(getAppId());
    }
  }
}

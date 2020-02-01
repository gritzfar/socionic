import 'package:flutter/material.dart';
import 'package:socionic_tools/appConfig.dart';
import 'package:socionic_tools/main.dart';

void main() {
  var configuredApp = AppConfig(
    hasAdds: false,
    child: MySocionicApp(),
  );

  WidgetsFlutterBinding.ensureInitialized();

  //mainCommon(configuredApp);

  runApp(configuredApp);
}

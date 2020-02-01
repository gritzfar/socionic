import 'package:flutter/material.dart';
import 'package:socionic_tools/appConfig.dart';
import 'package:socionic_tools/main.dart';

void main() {
  var configuredApp = AppConfig(
    hasAdds: true,
    testAdds: true,
    child: MySocionicApp(),
  );

  //mainCommon(configuredApp);

  runApp(configuredApp);
}

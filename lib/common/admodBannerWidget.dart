import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import 'appConfig.dart';

class AdModBannerWidget extends StatefulWidget {
  //static const Key sKey = Key("AdModBannerWidget");

  //const AdModBannerWidget({Key key = sKey}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AdModBannerWidgetState();
  }
}

class AdModBannerWidgetState extends State<AdModBannerWidget> {
  String _getBannerAdUnitId(bool testAdds) {
    if (testAdds) {
      //Test banner
      return "ca-app-pub-3940256099942544/6300978111";
    }

    // Orig banner id _free
    return "ca-app-pub-7993607976861905/5803013257";

    // Orig banner id
    // return "ca-app-pub-7993607976861905/6677424882";
  }

//  @override
//  void initState() {
//    super.initState();
//
//    _width = 50;
//    _failedToLoad = false;
//  }

  //double _width = 50;
  //bool _failedToLoad = false;
//  Widget _banner;

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.of(context).hasAds) {
      return Container(height: 0);
    }

//    if (_failedToLoad) {
//      return Container(height: 0);
//    }

    return Container(
        //height: 60,
        //width: _width,
        padding: EdgeInsets.only(top: 8.0),
        child: AdmobBanner(
          adUnitId: _getBannerAdUnitId(AppConfig.of(context).testAds),
          adSize: AdmobBannerSize.BANNER,
//            listener: (AdmobAdEvent event, Map<String, dynamic> args) {
//              if (event == AdmobAdEvent.failedToLoad) {
//                setState(() {
//                  _failedToLoad = true;
//                  //_width = 0;
//                });
//              }
//            }
        ));

//    return _banner;
  }
}

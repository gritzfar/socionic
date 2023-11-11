//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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

  BannerAd? _bannerAd;
  bool _isLoaded = false;

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

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(AppConfig
          .of(context)
          .testAds),
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.of(context).hasAds) {
      return Container(height: 0);
    }

    this.loadAd();

    if (_bannerAd != null) {
      return Container(
        padding: EdgeInsets.only(top: 8.0),
        //alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
        ),
      );
    }

   return Container(height: 0);
  }
}

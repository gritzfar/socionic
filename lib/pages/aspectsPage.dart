//import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/admodBannerWidget.dart';
import '../data/aspects.dart';
import '../models/aspect.dart';
import 'aspectPage.dart';

final aspects = [eIntuition, iIntuition, eSensoric, iSensoric, eLogic, iLogic, eEthic, iEthic];

class AspectDictionariesPage extends StatelessWidget {
  static const routeName = "/aspectDictionariesPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Словари информационных аспектов"),
      ),
//        drawer: AppDrawer(
//          context: context,
//        ),
      body:
//      ExpandableTheme(
//          data: ExpandableThemeData(
//              iconColor: Theme.of(context).disabledColor, useInkWell: true),
//          child:
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: aspects.length,
              itemBuilder: (context, i) {
                final aspect = aspects[i];

                return Card(
                    child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: Hero(child: aspect.icon, tag: aspect.tag),
                            title: Text(aspect.name, style: Theme.of(context).textTheme.headline6),
                            subtitle: Text(aspect.altName, overflow: TextOverflow.ellipsis),
                          )),
                      onTap: () {
                        Navigator.of(context).push(getAspectDictionaryPage(aspect));
                      },
                    ),
                  ],
                ));
              }),
      //)),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}

class AspectsPage extends StatelessWidget {
  static const routeName = "/aspectsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Информационные аспекты"),
      ),
//        drawer: AppDrawer(
//          context: context,
//        ),
      body:
//      ExpandableTheme(
//          data: ExpandableThemeData(
//              iconColor: Theme.of(context).disabledColor, useInkWell: true),
//          child:
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: aspects.length,
              itemBuilder: (context, i) {
                final aspect = aspects[i];

                return Card(
                    child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            leading: Hero(child: aspect.icon, tag: aspect.tag),
                            title: Text(aspect.name, style: Theme.of(context).textTheme.headline6),
                            subtitle: Text(aspect.altName, overflow: TextOverflow.ellipsis),
                          )),
                      onTap: () {
                        Navigator.of(context).push(getAspectPage(aspect));
                      },
                    ),
                  ],
                ));
              }),
      //)),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}

MaterialPageRoute<void> getAspectPage(Aspect aspect) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return AspectPage(aspect: aspect);
  });
}

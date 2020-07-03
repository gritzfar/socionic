//import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../common/admodBannerWidget.dart';
import '../common/appDrawer.dart';
import '../data/types.dart';
import '../models/typeDesc.dart';
import 'typeRelationsPage.dart';

MaterialPageRoute<void> getTypeRelationsPage(TypeDesc typeDesc, bool popNavigation) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return TypeRelationsPage(typeDesc: typeDesc, popNavigation: popNavigation);
  });
}

class RelationsPage extends StatelessWidget {
  static const String routeName = "/relationsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Отношения"),
      ),
      drawer: AppDrawer(
        context: context
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              //color: Theme.of(context).backgroundColor,
              child: Row(
                children: generateItems(context, [donType, dumasType, hugoType, robespierreType]),
              ),
            ),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems(context, [hamletType, maximGorkyType, zhukovType, yeseninType]),
            )),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems(context, [napoleonType, balzacType, jackLondonType, dreiserType]),
            )),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems(context, [stierlitzType, dostoyevskyType, huxleyType, gabinType]),
            ))
          ],
        ),
      ),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }

  List<Widget> generateItems(BuildContext context, List<TypeDesc> types) {
    List<Widget> list = new List<Widget>();

    for (var i = 0; i < types.length; i++) {
      list.add(
        new Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  FittedBox(
                      child: Text(
                    types[i].shortName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  InkWell(
                      child: SvgPicture.asset(
                        types[i].svg,
                        height: 120,
                        semanticsLabel: types[i].shortName,
                      ),
                      //width: 120,
                      onTap: () {
                        Navigator.of(context).push(getTypeRelationsPage(types[i], false));
                      }),
                ],
              )),
        ),
      );
    }

    return list;
  }
}

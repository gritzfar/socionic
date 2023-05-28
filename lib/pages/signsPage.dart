import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../common/typeHero.dart';
import '../common/admodBannerWidget.dart';
import '../common/appDrawer.dart';
import '../data/types.dart';
import '../models/typeDesc.dart';
import 'typeRelationsPage.dart';

MaterialPageRoute<void> getSignsPage(TypeDesc typeDesc, bool popNavigation) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return SignsPage(typeDesc: typeDesc);
  });
}

class SignsPage extends StatelessWidget {
  static const String routeName = "/signsPage";

  final TypeDesc typeDesc;

  const SignsPage({Key key, this.typeDesc}) : super();


  @override
  Widget build(BuildContext context) {
    var boldStyle = TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge.color);
    //var normalStyle = TextStyle(fontWeight: FontWeight.normal);

    return Scaffold(
      appBar: AppBar(
        title: Text("Признаки")
      ),
      body:
      ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: typeDesc.signs.length,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          itemBuilder: (context, i) {
            final sign = typeDesc.signs[i];

            var cont = Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(sign.name + ":", style: boldStyle),
                      Text(sign.desc),
                /*RichText(
                text: TextSpan(
                    text: sign.name + ". ",
                    style: boldStyle,
                    children: <TextSpan>[TextSpan(text: sign.desc, style: normalStyle)])),*/
                      Text(""),]));

            return cont;
          }),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}
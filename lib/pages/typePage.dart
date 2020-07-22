import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/admodBannerWidget.dart';
import '../common/typeHero.dart';
import '../models/typeDesc.dart';
import 'relationsPage.dart';
import 'signsPage.dart';

MaterialPageRoute<void> getTypeDescPage(TypeDesc typeDesc) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return TypePage(typeDesc: typeDesc);
  });
}

class TypePage extends StatelessWidget {
  final TypeDesc typeDesc;

  const TypePage({Key key, this.typeDesc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScaffoldNew(context);
  }

  /*Scaffold getScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(typeDesc.longName),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 16),
          alignment: Alignment.topLeft,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TypeHero(
                  typeDesc: typeDesc,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(width: 5),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(typeDesc.nameDescription, softWrap: true, maxLines: 3, style: Theme.of(context).textTheme.headline6),
                          FittedBox(child: Text(typeDesc.altName + " - " + typeDesc.mbti, style: Theme.of(context).textTheme.bodyText1)),
                          FittedBox(child: Text("Кредо: " + typeDesc.moto, style: Theme.of(context).textTheme.caption)),
                        ],
                      ),
                    ))
              ],
            ),
            Divider(),
            Row(children: <Widget>[
              OutlineButton(
                child: Wrap(
                  children: <Widget>[
                    Icon(Icons.all_out),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 4),
                      child: Text("Отношения"),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
                },
              ),
              OutlineButton(
                child: Wrap(
                  children: <Widget>[
                    Icon(Icons.tune),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 4),
                      child: Text("Признаки"),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
                },
              ),
            ]),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              text: "    Сильные стороны. ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.strongTypeDesc, style: TextStyle(fontWeight: FontWeight.normal))])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Уровень пользователя. ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.roleTypeDesc, style: TextStyle(fontWeight: FontWeight.normal))])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Слабые стороны. ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.weakTypeDesc, style: TextStyle(fontWeight: FontWeight.normal))])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Лучшее занятие ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.bestPractice, style: TextStyle(fontWeight: FontWeight.normal))])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Не подходит ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.worstPractice, style: TextStyle(fontWeight: FontWeight.normal))])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Для успешной работы ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              children: <TextSpan>[TextSpan(text: typeDesc.forEffectiveWork, style: TextStyle(fontWeight: FontWeight.normal))])),
                    ],
                  )),
            )
          ])),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }*/

  Scaffold getScaffoldNew(BuildContext context) {
    var boldStyle = TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1.color);
    var normalStyle = TextStyle(fontWeight: FontWeight.normal);
    return Scaffold(
      appBar: AppBar(
        title: Text(typeDesc.longName),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _SliverAppBarDelegate(typeDesc: typeDesc),
          ),
          SliverToBoxAdapter(
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              text: "    Сильные стороны. ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.strongTypeDesc, style: normalStyle)])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Уровень пользователя. ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.roleTypeDesc, style: normalStyle)])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Слабые стороны. ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.weakTypeDesc, style: normalStyle)])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Лучшее занятие ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.bestPractice, style: normalStyle)])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Не подходит ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.worstPractice, style: normalStyle)])),
                      Text(""),
                      RichText(
                          text: TextSpan(
                              text: "    Для успешной работы ",
                              style: boldStyle,
                              children: <TextSpan>[TextSpan(text: typeDesc.forEffectiveWork, style: normalStyle)])),
                    ],
                  )))
        ],
      ),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}

Widget _getTopBar(BuildContext context, TypeDesc typeDesc) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TypeHero(
          typeDesc: typeDesc,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Container(width: 5),
        Expanded(
            flex: 1,
            child: Container(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(typeDesc.nameDescription, softWrap: true, maxLines: 3, style: Theme.of(context).textTheme.headline6),
                  FittedBox(child: Text(typeDesc.altName + " - " + typeDesc.mbti, style: Theme.of(context).textTheme.bodyText2)),
                  FittedBox(child: Text("Кредо: " + typeDesc.moto, style: Theme.of(context).textTheme.caption)),
                ],
              ),
            ))
      ],
    ),
    Row(children: <Widget>[
      OutlineButton(
        child: Wrap(
          children: <Widget>[
            Icon(Icons.all_out),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 4),
              child: Text("Отношения"),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
        },
      ),
      Spacer(flex: 1),
      OutlineButton(
        child: Wrap(
          children: <Widget>[
            Icon(Icons.tune),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 4),
              child: Text("Признаки"),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(getSignsPage(typeDesc, true));
        },
      ),
    ]),
    Divider(),
  ]);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TypeDesc typeDesc;

  _SliverAppBarDelegate({this.typeDesc});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var offset = maxExtent - shrinkOffset < minExtent ? minExtent - maxExtent : -shrinkOffset;

    return Stack(overflow: Overflow.clip, children: <Widget>[
      Positioned(
          top: offset,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 0),
            width: MediaQuery.of(context).size.width,
            height: maxExtent,
            child: _getTopBar(context, typeDesc),
          ))
    ]);
  }

  @override
  double get maxExtent => 190;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

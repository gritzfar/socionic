import 'package:flutter/material.dart';
import 'package:socionic_tools/models/relation.dart';
import 'package:socionic_tools/models/typeDesc.dart';

import '../common/starRating.dart';
import '../common/typeHero.dart';
import '../data/types.dart';
import '../main.dart';
import 'relationDescriptionPage.dart';

class TypeRelationsPage extends StatelessWidget {
  static const List<TypeDesc> typesData = [
    donType,
    dumasType,
    hugoType,
    robespierreType,
    hamletType,
    maximGorkyType,
    zhukovType,
    yeseninType,
    napoleonType,
    balzacType,
    jackLondonType,
    dreiserType,
    stierlitzType,
    dostoyevskyType,
    huxleyType,
    gabinType
  ];
  final TypeDesc typeDesc;

  final bool popNavigation;

  const TypeRelationsPage({Key key, this.typeDesc, this.popNavigation})
      : super();

  @override
  Widget build(BuildContext context) {
//    Widget gridSection = Expanded(child: Padding(padding: EdgeInsets.all(5), child: getRows(context)));
//
//    Widget body = new Column(
//      // This makes each child fill the full width of the screen
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        gridSection,
//      ],
//    );

    var body = getRows(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Отношения: " + typeDesc.shortName),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
      bottomNavigationBar: getBanner(context),
    );
  }

  List<Widget> generateItems(BuildContext context, List<TypeDesc> types,
      List<Relation> relations, double width) {
    List<Widget> list = new List<Widget>();
    var color = Colors.amber;

    //double width = (MediaQuery.of(context).size.width / 4) - 6;
    //double width = (MediaQuery.of(context).size.width / 4) - 6;

    for (var i = 0; i < types.length; i++) {
      list.add(
        FittedBox(
            child: Card(
                margin: EdgeInsets.all(2),
                child: Container(
                    width: width,
                    padding: EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            types[i].shortName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          FittedBox(
                              child: Text(
                            relations[i].name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          )),
                          StarRating(
                            color: color,
                            rating: relations[i].rating,
                          ),
                          TypeHero(
                              typeDesc: types[i],
                              onTap: () {
                                //if (popNavigation) {
                                Navigator.of(context).push(
                                    getRelationDescriptionPage(relations[i]));
//                            } else {
//                              Navigator.of(context).push(getTypeDescPage(types[i]));
//                            }
                              })
                          //],)
                        ])))),
      );
    }

    return list;
  }

  Widget getRows(BuildContext context) {
    //double rowHeight = AppConfig.of(context).internal ? 180 : 160;
    double typeWidth = (MediaQuery.of(context).size.width - 20) / 4;

    var body = Center(
      child: ListView(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            //color: Theme.of(context).backgroundColor,
            child: Row(
              children: generateItems(
                  context,
                  [donType, dumasType, hugoType, robespierreType],
                  typeDesc.relations.take(4).toList(),
                  typeWidth),
            ),
          ),
          Container(
              //color: Theme.of(context).backgroundColor,
              child: Row(
            children: generateItems(
                context,
                [hamletType, maximGorkyType, zhukovType, yeseninType],
                typeDesc.relations.skip(4).take(4).toList(),
                typeWidth),
          )),
          Container(
              //color: Theme.of(context).backgroundColor,
              child: Row(
            children: generateItems(
                context,
                [napoleonType, balzacType, jackLondonType, dreiserType],
                typeDesc.relations.skip(8).take(4).toList(),
                typeWidth),
          )),
          Container(
              //color: Theme.of(context).backgroundColor,
              child: Row(
            children: generateItems(
                context,
                [stierlitzType, dostoyevskyType, huxleyType, gabinType],
                typeDesc.relations.skip(12).take(4).toList(),
                typeWidth),
          ))
        ],
      ),
    );

    /*var view = DiagonalScrollView(
        maxWidth: typeWidth * 4 + 20,
        maxHeight: rowHeight * 4,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            //width: rowWidth,
            height: rowHeight,
            //color: Theme.of(context).backgroundColor,
            //flex: 1,
            child: Row(
              children: generateItems(context, [donType, dumasType, hugoType, robespierreType], typeDesc.relations.take(4).toList(), typeWidth),
            ),
          ),
          Container(
              //width: rowWidth,
              height: rowHeight,
              child: Row(
                children: generateItems(context, [hamletType, maximGorkyType, zhukovType, yeseninType], typeDesc.relations.skip(4).take(4).toList(), typeWidth),
              )),
          Container(
              //width: rowWidth,
              height: rowHeight,
              child: Row(
                children:
                    generateItems(context, [napoleonType, balzacType, jackLondonType, dreiserType], typeDesc.relations.skip(8).take(4).toList(), typeWidth),
              )),
          Container(
              //width: rowWidth,
              height: rowHeight,
              //flex: 1,
              //color: Theme.of(context).backgroundColor,
              child: Row(
                children:
                    generateItems(context, [stierlitzType, dostoyevskyType, huxleyType, gabinType], typeDesc.relations.skip(12).take(4).toList(), typeWidth),
              ))
        ]));*/

    return body;
  }
}

MaterialPageRoute<void> getRelationDescriptionPage(Relation relation) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return RelationDescriptionPage(relation: relation);
  });
}

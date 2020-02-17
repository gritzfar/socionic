import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'appDrawer.dart';
import 'main.dart';
import 'relations.dart';
import 'typeHero.dart';
import 'types.dart';

MaterialPageRoute<void> getTypeRelationsPage(TypeDesc typeDesc, bool popNavigation) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return TypeRelationsPage(typeDesc: typeDesc, popNavigation: popNavigation);
  });
}

typedef void RatingChangeCallback(double rating);

//MaterialPageRoute<void> getTypeDescPage(TypeDesc typeDesc) {
//  return MaterialPageRoute<void>(builder: (BuildContext context) {
//    return TypePage(typeDesc: typeDesc);
//  });
//}

class RelationsPage extends StatefulWidget {
  static const String routeName = "/relationsPage";

  @override
  State<StatefulWidget> createState() => RelationsPageState();
}

class RelationsPageState extends State<RelationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Отношения"),
      ),
      drawer: AppDrawer(
        context: context,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              //color: Theme.of(context).backgroundColor,
              child: Row(
                children: generateItems([donType, dumasType, hugoType, robespierreType]),
              ),
            ),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems([hamletType, maximGorkyType, zhukovType, yeseninType]),
            )),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems([napoleonType, balzacType, jackLondonType, dreiserType]),
            )),
            Container(
                //color: Theme.of(context).backgroundColor,
                child: Row(
              children: generateItems([stierlitzType, dostoyevskyType, huxleyType, gabinType]),
            ))
          ],
        ),
      ),
      bottomNavigationBar: getBanner(context),
    );
  }

  List<Widget> generateItems(List<TypeDesc> types) {
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

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double size;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color, this.size = 15});

  @override
  Widget build(BuildContext context) {
    return new Row(mainAxisAlignment: MainAxisAlignment.center, children: new List.generate(starCount, (index) => buildStar(context, index)));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: this.size,
        color: Theme.of(context).backgroundColor,
        semanticLabel: "Качество",
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: this.size,
        color: color ?? Theme.of(context).buttonColor,
        semanticLabel: "Качество",
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: this.size,
        color: color ?? Theme.of(context).buttonColor,
        semanticLabel: "Качество",
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }
}

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

  const TypeRelationsPage({Key key, this.typeDesc, this.popNavigation}) : super();

  @override
  Widget build(BuildContext context) {
    Widget gridSection = Expanded(child: Padding(padding: EdgeInsets.all(5), child: getRows(context)));

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        gridSection,
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Отношения: " + typeDesc.shortName),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }

  List<Widget> generateItems(BuildContext context, List<TypeDesc> types, List<Relation> relations) {
    List<Widget> list = new List<Widget>();
    var color = Colors.amber;

    //double width = (MediaQuery.of(context).size.width / 4) - 6;
    //double width = (MediaQuery.of(context).size.width / 4) - 6;
    double width = 120;

    for (var i = 0; i < types.length; i++) {
      list.add(
        FittedBox(
            child: Card(
                margin: EdgeInsets.all(2),
                child: Container(
                    width: width,
                    padding: EdgeInsets.all(5),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                      Text(
                        types[i].shortName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        relations[i].name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      StarRating(
                        color: color,
                        rating: relations[i].rating,
                      ),
                      TypeHero(
                          typeDesc: types[i],
                          onTap: () {
                            //if (popNavigation) {
                            Navigator.of(context).push(getRelationDescriptionPage(relations[i]));
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
    double rowHeight = 180;
    //double rowWidth =  MediaQuery.of(context).size.width;

    return DiagonalScrollView(
        maxWidth: 120.0 * 4 + 20,
        maxHeight: 180.0 * 4,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            //width: rowWidth,
            height: rowHeight,
            //color: Theme.of(context).backgroundColor,
            //flex: 1,
            child: Row(
              children: generateItems(context, [donType, dumasType, hugoType, robespierreType], typeDesc.relations.take(4).toList()),
            ),
          ),
          Container(
              //width: rowWidth,
              height: rowHeight,
              child: Row(
                children: generateItems(context, [hamletType, maximGorkyType, zhukovType, yeseninType], typeDesc.relations.skip(4).take(4).toList()),
              )),
          Container(
              //width: rowWidth,
              height: rowHeight,
              child: Row(
                children:
                    generateItems(context, [napoleonType, balzacType, jackLondonType, dreiserType], typeDesc.relations.skip(8).take(4).toList()),
              )),
          Container(
              //width: rowWidth,
              height: rowHeight,
              //flex: 1,
              //color: Theme.of(context).backgroundColor,
              child: Row(
                children:
                    generateItems(context, [stierlitzType, dostoyevskyType, huxleyType, gabinType], typeDesc.relations.skip(12).take(4).toList()),
              ))
        ]));
  }
}

MaterialPageRoute<void> getRelationDescriptionPage(Relation relation) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return RelationDescriptionPage(relation: relation);
  });
}

class RelationDescriptionPage extends StatelessWidget {
  final Relation relation;

  RelationDescriptionPage({Key key, this.relation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(children: <Widget>[
              FittedBox(
                child: Text(relation.longName),
              )
            ]),
            Text(relation.moto, style: Theme.of(context).textTheme.caption)
          ],
        )),
        body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _SliverAppBarDelegate(relation: relation),
          ),
          SliverToBoxAdapter(
              child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(children: <Widget>[
              Text(relation.desc ?? "TEST"),
            ]),
          ))
        ]));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Relation relation;

  _SliverAppBarDelegate({this.relation});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var offset = maxExtent - shrinkOffset < minExtent ? minExtent - maxExtent : -shrinkOffset;

    return Stack(overflow: Overflow.clip, children: <Widget>[
      Positioned(
          top: offset,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: maxExtent,
              child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 0),
                  child: _getTopBar(context, relation))))
    ]);
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget _getTopBar(BuildContext context, Relation relation) {
  return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    StarRating(
      color: Colors.amber,
      rating: relation.rating,
      size: 40,
    ),
    Divider(
      height: 5,
    )
  ]);
}

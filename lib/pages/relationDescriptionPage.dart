import 'package:flutter/material.dart';
import 'package:socionic_tools/models/relation.dart';

import '../common/appConfig.dart';
import '../common/starRating.dart';
import '../main.dart';

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
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            AppConfig.of(context).internal
                ? SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: _SliverAppBarDelegate(relation: relation),
                  )
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                  ),
            SliverToBoxAdapter(
                child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(children: <Widget>[
                Text(relation.desc ?? "TEST"),
              ]),
            ))
          ]),
      bottomNavigationBar: getBanner(context),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Relation relation;

  _SliverAppBarDelegate({this.relation});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var offset = maxExtent - shrinkOffset < minExtent
        ? minExtent - maxExtent
        : -shrinkOffset;

    return Stack(overflow: Overflow.clip, children: <Widget>[
      Positioned(
          top: offset,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: maxExtent,
              child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding:
                      EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 0),
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
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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

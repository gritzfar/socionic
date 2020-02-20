//import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/admodBannerWidget.dart';
import '../common/appConfig.dart';
import '../models/aspect.dart';
import 'aspectDictionaryPage.dart';

class AspectPage extends StatelessWidget {
  final Aspect aspect;

  const AspectPage({Key key, this.aspect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScaffoldNew(context);
  }

  Scaffold getScaffoldNew(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Hero(child: aspect.icon, tag: aspect.tag), Container(width: 15), Text(aspect.name)],
        ),
      ),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverAppBarDelegate(aspect: aspect),
        ),
        SliverToBoxAdapter(
            child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(children: <Widget>[
            Text("Проявление функций", style: Theme.of(context).textTheme.title),
            Text(""),
            Text("    " + aspect.func[0]),
            Text(""),
            Text("    " + aspect.func[1]),
            Text(""),
            Text("    " + aspect.func[2]),
            Text(""),
            Text("    " + aspect.func[3]),
            Text(""),
            Text("    " + aspect.func[4]),
            Text(""),
            Text("    " + aspect.func[5]),
            Text(""),
            Text("    " + aspect.func[6]),
            Text(""),
            Text("    " + aspect.func[7]),
          ]),
        ))
      ]),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}

Widget _getTopBar(BuildContext context, Aspect aspect) {
  if (AppConfig.of(context).internal) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(aspect.desc, maxLines: 5),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OutlineButton(
            child: Wrap(
              children: <Widget>[
                Icon(Icons.list),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 4),
                  child: Text("Словарь"),
                )
              ],
            ),
            onPressed: () {
              Navigator.of(context).push(getAspectDictionaryPage(aspect));
            },
          ),
          Divider(
            height: 5,
          )
        ],
      )
    ]);
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(aspect.desc, maxLines: 5),
        Divider(
          height: 5,
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Aspect aspect;

  _SliverAppBarDelegate({this.aspect});

  double _maxExtent = 150;
  double _minExtent = 55;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var offset = maxExtent - shrinkOffset < minExtent ? minExtent - maxExtent : -shrinkOffset;

    if (!AppConfig.of(context).internal) {
      _minExtent = 5;
      _maxExtent = 85;
    }

    return Stack(overflow: Overflow.clip, children: <Widget>[
      Positioned(
          top: offset,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: maxExtent,
              child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 0),
                  child: _getTopBar(context, aspect))))
    ]);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

MaterialPageRoute<void> getAspectDictionaryPage(Aspect aspect) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return AspectDictionaryPage(aspect: aspect);
  });
}

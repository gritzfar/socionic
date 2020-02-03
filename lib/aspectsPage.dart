import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'aspectDictionary.dart';
import 'main.dart';

final aspects = [eIntuition, iIntuition, eSensoric, iSensoric, eLogic, iLogic, eEthic, iEthic];

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
      body: ExpandableTheme(
          data: ExpandableThemeData(iconColor: Theme.of(context).disabledColor, useInkWell: true),
          child: ListView.builder(
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
                          title: Text(aspect.name, style: Theme.of(context).textTheme.title),
                          subtitle: Text(aspect.altName, overflow: TextOverflow.ellipsis),
                        )),
                    onTap: () {
                      Navigator.of(context).push(getAspectPage(aspect));
                    },
                  ),
                ],
              ));
            },
          )),
      bottomNavigationBar: getBanner(context),
    );
  }
}

MaterialPageRoute<void> getAspectPage(Aspect aspect) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return AspectPage(aspect: aspect);
  });
}

class AspectPage extends StatelessWidget {
  final Aspect aspect;

  const AspectPage({Key key, this.aspect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getScaffoldNew(context);
  }

  Scaffold getScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Hero(child: aspect.icon, tag: aspect.tag), Container(width: 15), Text(aspect.name)],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.topLeft,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text(aspect.desc),
            Text(""),
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
                //Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
              },
            ),
            Divider(),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: <Widget>[
                    Text("Проявление функций", style: Theme.of(context).textTheme.title),
                    Text(""),
                    Text(aspect.func[0]),
                    Text(""),
                    Text(aspect.func[1]),
                    Text(""),
                    Text(aspect.func[2]),
                    Text(""),
                    Text(aspect.func[3]),
                    Text(""),
                    Text(aspect.func[4]),
                    Text(""),
                    Text(aspect.func[5]),
                    Text(""),
                    Text(aspect.func[6]),
                    Text(""),
                    Text(aspect.func[7]),
                  ]),
                ))
          ])),
      bottomNavigationBar: getBanner(context),
    );
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
        ]));
  }
}

Widget _getTopBar(Aspect aspect) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    Text(aspect.desc),
    Text(""),
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
        //Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
      },
    ),
    Divider()
  ]);
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Aspect aspect;

  _SliverAppBarDelegate({this.aspect});

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
            child: _getTopBar(aspect),
          ))
    ]);
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

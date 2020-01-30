import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socionic_tools/aspectDictionary.dart';

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
            data: ExpandableThemeData(
                iconColor: Theme.of(context).disabledColor, useInkWell: true),
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
                            title: Text(aspect.name,
                                style: Theme.of(context).textTheme.display1),
                            subtitle: Text(aspect.altName),
                          )),
                      onTap: () {
                        Navigator.of(context).push(getAspectPage(aspect));
                      },
                    ),
                  ],
                ));
              },
            )));
  }
}

class AspectPage extends StatelessWidget {
  final Aspect aspect;

  const AspectPage({Key key, this.aspect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(child: aspect.icon, tag: aspect.tag),
              Container(width: 15),
              Text(aspect.name)
            ],
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
//                      Hero(
//                        child: aspect.icon, tag: aspect.tag,
////                        onTap: () {
////                          Navigator.of(context).pop();
////                        },
//                      ),
                      Container(width: 15),
//                      Expanded(
//                          flex: 1,
//                          child: Container(
//                            height: 110,
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: <Widget>[
//                                Text(aspect.altName,
//                                    softWrap: true,
//                                    maxLines: 3,
//                                    style: Theme.of(context).textTheme.title),
////                                FittedBox(child: Text(typeDesc.altName + " - " + typeDesc.mbti,
////                                    style: Theme.of(context).textTheme.body2)),
////                                FittedBox(child: Text("Кредо: " + typeDesc.moto,
////                                    style: Theme.of(context).textTheme.caption)),
//                              ],
//                            ),
//                          ))Expanded(
//                          flex: 1,
//                          child: Container(
//                            height: 110,
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                              children: <Widget>[
//                                Text(aspect.altName,
//                                    softWrap: true,
//                                    maxLines: 3,
//                                    style: Theme.of(context).textTheme.title),
////                                FittedBox(child: Text(typeDesc.altName + " - " + typeDesc.mbti,
////                                    style: Theme.of(context).textTheme.body2)),
////                                FittedBox(child: Text("Кредо: " + typeDesc.moto,
////                                    style: Theme.of(context).textTheme.caption)),
//                              ],
//                            ),
//                          ))
                    ],
                  ),
                  Divider(),
                  OutlineButton(
                    child: Wrap(
                      children: <Widget>[
                        Icon(Icons.all_out),
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
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
//                        child:
//                        Text(
//                          typeDesc.description,
//                          style: Theme.of(context).textTheme.body1,
//                        )
                    ),
                  )
                ])));
  }
}

MaterialPageRoute<void> getAspectPage(Aspect aspect) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return AspectPage(aspect: aspect);
  });
}

final aspects = [
  eIntuition,
  iIntuition,
  eSensoric,
  iSensoric,
  eLogic,
  iLogic,
  eEthic,
  iEthic
];

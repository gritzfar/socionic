import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'aspects.dart';

class AspectDictionaryPage extends StatelessWidget {
  final Aspect aspect;

  AspectDictionaryPage({Key key, this.aspect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(child: aspect.icon, tag: aspect.tag),
              Container(width: 15),
              Text("Словарь")
            ],
          ),
        ),
        body: buildThemes(context));
  }

  Widget buildThemes(BuildContext context) {
    return ExpandableTheme(
        data: ExpandableThemeData(
            iconColor: Theme.of(context).disabledColor, useInkWell: true),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: aspect.dictionary.semanticThemes.length,
            itemBuilder: (context, i) {
              var theme = aspect.dictionary.semanticThemes[i];
              return Card(
                  child: Column(
                children: <Widget>[
                  Container(
                      //padding: EdgeInsets.only(bottom: 5),
                      child: ListTile(
                    //leading: new Icon(Icons.border_all),
                    title: Text(theme.name,
                        style: Theme.of(context).textTheme.title),
                    //subtitle: Text(quadrate.moto),
                  )),
                  Divider(),
                  ExpandablePanel(
                      header: Container(),
//                      header: Builder(builder: (context) {
//                        var controller = ExpandableController.of(context);
//                        return controller.expanded ? Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Свернуть")) : Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Развернуть"));
//                      }),
                      expanded: Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: Column(
                            children: theme.subThemes.map((item) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.black12,
                                        child:
                                    Text(
                                      item.name,
                                      style: Theme.of(context).textTheme.body2,
                                    )),
                                    //Divider(),
                                    Container(
                                      padding: EdgeInsets.only(left: 20, bottom: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: item.words.map((word) {
                                          return Text(word);
                                        }).toList(),
                                      ),
                                    )
                                  ]);
                              return Text(item.name);
                            }).toList(),
                          )))
                ],
              ));
            }));
  }
}

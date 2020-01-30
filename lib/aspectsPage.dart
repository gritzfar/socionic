import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socionic_tools/aspectDictionary.dart';

class AspectsPage extends StatelessWidget{

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
                        Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: aspect.icon,
                              title: Text(aspect.name,
                                  style: Theme.of(context).textTheme.display1),
                              subtitle: Text(""),
                            )),
                        Divider(),
                        ExpandablePanel(
                            header: Container(),
//                      header: Builder(builder: (context) {
//                        var controller = ExpandableController.of(context);
//                        return controller.expanded ? Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Свернуть")) : Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Развернуть"));
//                      }),
                            expanded: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Text("")))
                      ],
                    ));
              },
            )));
  }
}

final aspects = [eIntuition, iIntuition, eSensoric, iSensoric, eLogic, iLogic, eEthic, iEthic];
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socionic_tools/appDrawer.dart';
import 'package:socionic_tools/main.dart';
import 'package:socionic_tools/typeHero.dart';
import 'package:socionic_tools/typePage.dart';
import 'package:socionic_tools/types.dart';

class TypesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TypesPageState();

  static const String routeName = "/typesPage";
}

class TypesPageState extends State<TypesPage> {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Социотипы"),
      ),
      drawer: AppDrawer(
        context: context,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          physics: const BouncingScrollPhysics(),
          children: getRows(),
        ),
      ),
      bottomNavigationBar: getBanner(context),
    );

    return scaffold;
  }

  List<Row> getRows() {
    return <Row>[
      getRow([donType, dumasType, hugoType, robespierreType]),
      getRow([hamletType, maximGorkyType, zhukovType, yeseninType]),
      getRow([napoleonType, balzacType, jackLondonType, dreiserType]),
      getRow([stierlitzType, dostoyevskyType, huxleyType, gabinType])
    ];
  }

  Row getRow(List<TypeDesc> types) {
    return Row(
      children: generateItems(types),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    types[i].shortName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TypeHero(
                      typeDesc: types[i],
                      onTap: () {
                        Navigator.of(context).push(getTypeDescPage(types[i]));
                      }),
                ],
              ),
            )),
      );
    }

    return list;
  }
}

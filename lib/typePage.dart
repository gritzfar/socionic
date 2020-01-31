import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socionic_tools/main.dart';
import 'package:socionic_tools/relationsPage.dart';
import 'package:socionic_tools/typeHero.dart';
import 'package:socionic_tools/types.dart';

class TypePage extends StatelessWidget {
  const TypePage({Key key, this.typeDesc}) : super(key: key);

  final TypeDesc typeDesc;

  @override
  Widget build(BuildContext context) {
    return getScaffold(context);
  }

  Scaffold getScaffold(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(typeDesc.longName),
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
                                Text(typeDesc.nameDescription,
                                    softWrap: true,
                                    maxLines: 3,
                                    style: Theme.of(context).textTheme.title),
                                FittedBox(child: Text(typeDesc.altName + " - " + typeDesc.mbti,
                                    style: Theme.of(context).textTheme.body2)),
                                FittedBox(child: Text("Кредо: " + typeDesc.moto,
                                    style: Theme.of(context).textTheme.caption)),
                              ],
                            ),
                          ))
                    ],
                  ),
                  Divider(),
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
                      Navigator.of(context)
                          .push(getTypeRelationsPage(typeDesc, true));
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          app_IsInTest ? "TEST String" : typeDesc.description,
                          style: Theme.of(context).textTheme.body1,
                        )),
                  )
                ])));
  }
}

MaterialPageRoute<void> getTypeDescPage(TypeDesc typeDesc) {
  return MaterialPageRoute<void>(builder: (BuildContext context) {
    return TypePage(typeDesc: typeDesc);
  });
}

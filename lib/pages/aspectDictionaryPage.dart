import 'package:flutter/material.dart';

import '../common/admodBanner.dart';
import '../models/aspect.dart';
import '../models/semanticTheme.dart';

class AspectDictionaryPage extends StatefulWidget {
  final Aspect aspect;

  AspectDictionaryPage({Key key, this.aspect}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AspectDictionaryState(aspect: aspect);
  }
}

class _AspectDictionaryState extends State<AspectDictionaryPage> {
  final Aspect aspect;

  _AspectDictionaryState({this.aspect});

  @override
  void initState() {
    semanticThemes.addAll(aspect.dictionary?.semanticThemes ??
        <SemanticTheme>[SemanticTheme(name: "Страница в разработке, ждите обновлений", subThemes: <SubSemanticTheme>[])]);
    super.initState();
  }

  TextEditingController editingController = TextEditingController();

  double _clearOpacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Hero(child: aspect.icon, tag: aspect.tag), Container(width: 15), Text("Словарь")],
        ),
      ),
      body: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Искать",
                  hintText: "Искать",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Opacity(
                    child: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        editingController.clear();
                        setState(() {
                          _clearOpacity = 0;
                          semanticThemes.clear();
                          semanticThemes.addAll(aspect.dictionary.semanticThemes);
                        });
                      },
                    ),
                    opacity: _clearOpacity,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              onChanged: (query) {
                var themes = aspect.dictionary.applyFilter(query);
                setState(() {
                  semanticThemes.clear();
                  semanticThemes.addAll(themes);
                  _clearOpacity = (query.length > 0) ? 1 : 0;
                });
              },
            )),
        Expanded(
          child: buildThemes(context),
        )
      ]),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }

  List<SemanticTheme> semanticThemes = new List<SemanticTheme>();

  Widget buildThemes(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: semanticThemes.length,
        itemBuilder: (context, i) {
          var theme = semanticThemes[i];
          return Card(
              child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(theme.name),
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Column(
                        children: theme.subThemes.map((item) {
                          return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black12,
                                ),
                                padding: EdgeInsets.all(5),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Text(
                                  item.name,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .body2,
                                )),
                            //Divider(),
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 5, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: item.words.map((word) {
                                  return Text(word);
                                }).toList(),
                              ),
                            )
                          ]);
                        }).toList(),
                      ))
                ],
              ),
            ],
          ));
        });
  }
}

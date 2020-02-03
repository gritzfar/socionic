import 'package:flutter/material.dart';

import 'main.dart';
import 'typeHero.dart';
import 'typePage.dart';
import 'types.dart';

class Aspect {
  bool value;

  final String falseValue;
  final String trueValue;

  Aspect({this.falseValue, this.trueValue}) : super();

  @override
  String toString() {
    if (value == null) return "";

    return value ? this.trueValue : this.falseValue;
  }
}

class AspectCalculationPage extends StatefulWidget {
  static const routeName = "/typingPage";

  @override
  State<StatefulWidget> createState() => AspectCalculationPageState();
}

class AspectCalculationPageState extends State<AspectCalculationPage> {
  final List<TypeDesc> initData = [
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

  List<TypeDesc> _data = [];

  final Aspect ieDichotimie = Aspect(falseValue: "Интроверсия", trueValue: "Экстроверсия");

  final Aspect elDichotimie = Aspect(falseValue: "Этика", trueValue: "Логика");

  final Aspect siDichotimie = Aspect(falseValue: "Сенсорика", trueValue: "Интуиция");

  final Aspect irDichotimie = Aspect(falseValue: "Иррациональность", trueValue: "Рациональность");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Типирование")),
      body: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(ieDichotimie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(elDichotimie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(siDichotimie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(irDichotimie))
              ],
            )),
        Expanded(
            child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 3.0, mainAxisSpacing: 4.0, childAspectRatio: .58),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            //double width = MediaQuery.of(context).size.width * 0.23;

            return
//              new Flexible(
//              flex: 1,
//              fit: FlexFit.tight,
//              child:
                Container(
              alignment: Alignment.topCenter,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                      child: Text(
                    _data[i].shortName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  TypeHero(
                      typeDesc: _data[i],
                      //width: width,
                      onTap: () {
                        Navigator.of(context).push(getTypeDescPage(_data[i]));
                      }),
                ],
              ),
            );
          },
          itemCount: _data.length,
        ))
      ]),
      bottomNavigationBar: getBanner(context),
    );
  }

  @override
  void initState() {
    super.initState();
    _data = initData;
  }

  void _filterData() {
    //setState(() {
    var dataToFilter = initData.toList();

    dataToFilter = dataToFilter.where((v) => ieDichotimie.value == null || v.extraversion == ieDichotimie.value).toList();
    dataToFilter = dataToFilter.where((v) => elDichotimie.value == null || v.logic == elDichotimie.value).toList();
    dataToFilter = dataToFilter.where((v) => siDichotimie.value == null || v.intuition == siDichotimie.value).toList();
    dataToFilter = dataToFilter.where((v) => irDichotimie.value == null || v.rationalization == irDichotimie.value).toList();

    _data = dataToFilter;
    //});
  }

  List<Widget> _getChips(Aspect dichotomie) {
    return <Widget>[
      Expanded(
          child: FilterChip(
        showCheckmark: false,
        //avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
        label: Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
            //width: 150,
            alignment: Alignment.center,
            child: Text(dichotomie.trueValue, overflow: TextOverflow.ellipsis)),
        selected: dichotomie.value == true,
        onSelected: (bool selected) {
          setState(() {
            dichotomie.value = selected ? true : null;
            _filterData();
          });
        },
      )),
      VerticalDivider(width: 5),
      Expanded(
          child: FilterChip(
        showCheckmark: false,
        //avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
        label: Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
            //width: 150,
            alignment: Alignment.center,
            child: Text(dichotomie.falseValue, overflow: TextOverflow.ellipsis)),
        selected: dichotomie.value == false,
        onSelected: (bool selected) {
          setState(() {
            dichotomie.value = selected ? false : null;
            _filterData();
          });
        },
      ))
    ];
  }
}

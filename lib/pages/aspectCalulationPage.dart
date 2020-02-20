import 'package:flutter/material.dart';

import '../common/admodBannerWidget.dart';
import '../common/typeHero.dart';
import '../data/types.dart';
import '../models/dichotomie.dart';
import '../models/typeDesc.dart';
import 'typePage.dart';

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

  final Dichotomie ieDichotomie = Dichotomie(falseValue: "Интроверсия", trueValue: "Экстроверсия");

  final Dichotomie elDichotomie = Dichotomie(falseValue: "Этика", trueValue: "Логика");

  final Dichotomie siDichotomie = Dichotomie(falseValue: "Сенсорика", trueValue: "Интуиция");

  final Dichotomie irDichotomie = Dichotomie(falseValue: "Иррациональность", trueValue: "Рациональность");

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 30) / 4;
    var aspect = width / (typeHeroHeight + 15);

    return Scaffold(
      appBar: AppBar(title: Text("Типирование")),
      body: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(ieDichotomie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(elDichotomie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(siDichotomie)),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: _getChips(irDichotomie))
              ],
            )),
        Expanded(
            child: GridView.builder(
          shrinkWrap: false,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0, childAspectRatio: aspect),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, i) {
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
      bottomNavigationBar: AdModBannerWidget(),
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

    dataToFilter = dataToFilter.where((v) => ieDichotomie.value == null || v.extraversion == ieDichotomie.value).toList();
    dataToFilter = dataToFilter.where((v) => elDichotomie.value == null || v.logic == elDichotomie.value).toList();
    dataToFilter = dataToFilter.where((v) => siDichotomie.value == null || v.intuition == siDichotomie.value).toList();
    dataToFilter = dataToFilter.where((v) => irDichotomie.value == null || v.rationalization == irDichotomie.value).toList();

    _data = dataToFilter;
    //});
  }

  List<Widget> _getChips(Dichotomie dichotomie) {
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

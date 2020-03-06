import 'package:flutter/material.dart';

import '../common/admodBannerWidget.dart';

class ModelAPage extends StatelessWidget {
  static const String routeName = "/modelAPage";

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.subtitle1;
    var boldStyle = TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1.color);
    var normalStyle = TextStyle(fontWeight: FontWeight.normal);

    return Scaffold(
      appBar: AppBar(title: Text("Модель А")),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: _SliverAppBarDelegate(),
        ),
        SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Text("Ячейки модели А", style: titleStyle, textAlign: TextAlign.center),
                  Text(""),
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: "1. Базовая функция ",
                          style: boldStyle,
                          children: <TextSpan>[TextSpan(text: "основа личности", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text: TextSpan(
                          text: "2. Творческая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text:
                          TextSpan(text: "3. Ролевая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text:
                          TextSpan(text: "4. Болевая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text: TextSpan(
                          text: "5. Внушаемая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text: TextSpan(
                          text: "6. Активационая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text: TextSpan(
                          text: "7. Ограничительная функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  RichText(
                      text:
                          TextSpan(text: "8. Фоновая функция ", style: boldStyle, children: <TextSpan>[TextSpan(text: "текст", style: normalStyle)])),
                  Text(""),
                  Text("Ментально / Витальное кольцо", style: titleStyle, textAlign: TextAlign.center),
                  Text(
                      "Ячейки 1, 2, 3 и 4 называются ментальным кольцом. Это наше сознание. Это то о чем мы думаем.\r\n\r\nЯчейки 5, 6, 7 и 8 нызваются витальным кольцом. Это наше подсознание. Эти функции работают вне зависимости от нашего сознания. И повлиять на их работу сложнее."),
                  Text(""),
                  Text("Мерность функций", style: titleStyle, textAlign: TextAlign.center),
                  Text("Функции могу быть разных мерностей, от 1 до 4. Чем больше мерность, тем глубже и экспертнее фукция."),
                  Text("Ячейки 1 и 8 имеют мерность 4. Это самые сильные и экспертные функции. Они видят информацию во всем её объеме и полноте."),
                  Text("Ячейки 2 и 7 имеют мерность 3. Это функции также сильные, но менее экспертны, и применяться ситуативно."),
                  Text(
                      "Ячейки 3 и 6 имеют мерность 2. Функции в этих ячейках слабые, поле информации видится поверхностно. Но тем не менее они обучаемы."),
                  Text("Ячейки 4 и 5 имеют мерность 1. Очень слабое виденье поля информации, обучение происходит только на собсвенном опыте."),
                  Text(""),
                  Text("Оценочность / ситуативность", style: titleStyle, textAlign: TextAlign.center),
                  Text(""),
                  Text("Инертность / контактность", style: titleStyle, textAlign: TextAlign.center),
                  Text(""),
                  Text("Ценостные / не ценостные", style: titleStyle, textAlign: TextAlign.center),
                  Text(""),
                ])))
      ]),
      bottomNavigationBar: AdModBannerWidget(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
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
            child: _getTopBar(context),
          ))
    ]);
  }

  @override
  double get maxExtent => 145;

  @override
  double get minExtent => 15;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget _getTopBar(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset("images/model_a.png", width: 80, height: 120, semanticLabel: "Модель А")
//              SvgPicture.asset(
//                "svgs/model_a.svg",
//                width: 80,
//                height: 120,
//                semanticsLabel: "Модель А",
//              )
              ),
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
                  Text("Описание модели А", softWrap: true, maxLines: 3, style: Theme.of(context).textTheme.headline6),
                  FittedBox(child: Text("Ячейки модели А", style: Theme.of(context).textTheme.bodyText2)),
                  FittedBox(child: Text("Поведение функции в различних ячейках", style: Theme.of(context).textTheme.caption)),
                ],
              ),
            ))
      ],
    ),
//    OutlineButton(
//      child: Wrap(
//        children: <Widget>[
//          Icon(Icons.all_out),
//          Padding(
//            padding: EdgeInsets.only(left: 8.0, top: 4),
//            child: Text("Отношения"),
//          )
//        ],
//      ),
//      onPressed: () {
//        Navigator.of(context).push(getTypeRelationsPage(typeDesc, true));
//      },
//    ),
    Divider(),
  ]);
}

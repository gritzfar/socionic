import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main.dart';

final quadrates = <QuadrateData>[
  QuadrateData(
      title: "Альфа квадра",
      moto: "Хорошо, когда весело, интересно, понятно и комфортно.",
      description: Column(
        children: <Widget>[
          Text(
              "Квадра Альфа имеет в ценностях следующие аспекты соционики: ЧИ (Интуиция возможностей), ЧЭ (Этика эмоций), БЛ (Структурная логика) и БС (Сенсорика ощущений). Если объяснить это простыми словами, то представители этой квадры — Дон Кихот, Дюма, Гюго и Робеспьер — ценят необычные теории и новые возможности, они с радостью проводят время в уюте, отдыхая среди друзей, делясь друг с другом хорошим настроением."),
          Text(""),
          Text(
              "Представители квадры Альфа ценят нестандартные решения, они любят фантазировать и придумывать новое. Альфийцы борются за свободу слова, стремятся к обновлению мира и устоев. Большинство революционеров в истории мира были представителями квадры Альфа."),
          Text(""),
          Text(
              "Альфийцы не выносят шаблонного мышления, они избегают мест, где их ограничивают морально и физически. Представители квадры Альфа – позитивные и легкие люди, которым нравится делиться приятными чувствами друг с другом, которые считают, что мир полон новых открытий и впечатлений. При этом, альфийцы не забывают о комфорте, о том, что мы живем в материальном мире и нет ничего лучше, чем вкусная еда и здоровый сон.")
        ],
      )),
  QuadrateData(
      title: "Бета квадра",
      moto: "Бороться, любить, ловить момент и быть справедливым.",
      description: Column(
        children: <Widget>[
          Text(
              "Квадра Бета имеет в ценностях следующие аспекты соционики: БИ (Интуиция времени), ЧЭ (Этика эмоций), БЛ (Структурная логика) и ЧС (Силовая сенсорика). Все представители этой квадры — Жуков, Есенин, Максим Горький и Гамлет — люди сильные и настроенные на борьбу ради того, чтобы стать первыми в своем деле и в жизни."),
          Text(""),
          Text(
              "Для бетанцев важно не обращать внимание на слабости, превозмогать, упорно идти к цели несмотря на неудачи и возникающие проблемы. Представители Беты интересуются мировой историей, проводят параллели между настоящим и прошлым, любят людей эмоциональных и чувствующих, верят в судьбу и во всем стараются быть лучшими."),
          Text(""),
          Text(
              "Представители квадры Бета не любят слабаков, тех людей, которые быстро сдаются. Бетанцы готовы пожертвовать мелкими радостями быта ради большой цели, которая всегда маячит на горизонте. Для них важно быть храбрыми, сильными и ощущать себя избранными.")
        ],
      )),
  QuadrateData(
      title: "Гамма квадра",
      moto: "Тщательны прогноз - залог успешной авантюры.",
      description: Column(
        children: <Widget>[
          Text(
              "Квадра Гамма имеет в ценностях следующие аспекты соционики: БИ (Интуиция времени), БЭ (Этика отношений), ЧЛ (Деловая логика) и ЧС (Силовая сенсорика). Все представители этой квадры — Наполеон, Бальзак, Джек Лондон и Драйзер — люди простые в общении и хваткие по жизни."),
          Text(""),
          Text(
              "Гаммийцы любят работать и любят зарабатывать деньги. Для них деньги играют важную роль в жизни, ведь представители этой квадры любят не только хорошо поработать, но и хорошо отдохнуть. В общении представители Гаммы очень демократичны, они ценят не звания, а настоящие таланты окружающих людей."),
          Text(""),
          Text(
              "Представители Гаммы не выносят снобизм и тяжелых на подъем людей. В Гамме не понимают людей, которые не хотят работать. Для гаммийцев очень важно реализовать себя как в работе, так и в личной жизни.")
        ],
      )),
  QuadrateData(
      title: "Дельта квадра",
      moto: "Стабильность, дружелюбность, практичность и комфорт.",
      description: Column(
        children: <Widget>[
          Text(
              "Квадра Дельта имеет в ценностях следующие аспекты соционики: ЧИ (Интуиция возможностей), БЭ (Этика отношений), ЧЛ (Деловая логика) и БС (Сенсорика ощущений). Все представители этой квадры — Штирлиц, Достоевский, Гексли и Габен — ориентируются на «вечные» ценности в стабильном мире."),
          Text(""),
          Text(
              "Дельтийцы ценят такие вещи, как уют, благополучие, стабильный доход, им важно, чтобы рядом были близкие люди, которым можно доверять. Представители Дельты считают, что для комфортной жизни важна самореализация, работа, приносящая хорошие деньги, отсутствие отрицательных ощущений и приятные люди вокруг."),
          Text(""),
          Text(
              "Представители этой квадры не понимают идеи ради идей, они ценят изобретательность, которую можно применить на практике, получив реальную выгоду. Дельтийцы считают важнейшей частью человека его нравственность, мудрость, доброту.")
        ],
      ))
];

class QuadrateData {
  final String title;

  final String moto;
  final Column description;

  const QuadrateData({this.title, this.moto, this.description}) : super();
}

class QuadratesPage extends StatefulWidget {
  static const routeName = "/qudratesPage";

  @override
  State<StatefulWidget> createState() => QuadratesPageState();
}

class QuadratesPageState extends State<QuadratesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Квадры"),
      ),
//        drawer: AppDrawer(
//          context: context,
//        ),
      body: ExpandableTheme(
          data: ExpandableThemeData(iconColor: Theme.of(context).disabledColor, useInkWell: true),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: quadrates.length,
            itemBuilder: (context, i) {
              final quadrate = quadrates[i];

              return Card(
                  child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        leading: new Icon(Icons.border_all),
                        title: Text(quadrate.title, style: Theme.of(context).textTheme.display1),
                        subtitle: Text(quadrate.moto),
                      )),
                  Divider(),
                  ExpandablePanel(
                      header: Container(),
//                      header: Builder(builder: (context) {
//                        var controller = ExpandableController.of(context);
//                        return controller.expanded ? Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Свернуть")) : Padding( padding: EdgeInsets.only(left: 15, top: 10), child: Text("Развернуть"));
//                      }),
                      expanded: Container(margin: EdgeInsets.only(left: 15, right: 15, bottom: 15), child: quadrate.description))
                ],
              ));
            },
          )),
      bottomNavigationBar: getBanner(context),
    );
  }
}

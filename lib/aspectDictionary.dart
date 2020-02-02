import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socionic_tools/customPainters.dart';

final eEthic = Aspect(name: "Черная этика", altName: "Экстравертная этика (Рациональная)", icon: getIcon(EthicIcon(color: Colors.black54), 20, 20));

final eIntuition =
Aspect(name: "Черная интуиция", altName: "Экстравертная интуиция (Иррациональная)", icon: getIcon(IntuitionIcon(color: Colors.black54), 20, 20));

final eLogic = Aspect(name: "Черная логика", altName: "Экстравертная логика (Рациональная)", icon: getIcon(LogicIcon(color: Colors.black54), 20, 20));

final eSensoric =
Aspect(name: "Черная сенсорика", altName: "Экстравертная сенсорика (Иррациональная)", icon: getIcon(SensoricIcon(color: Colors.black54), 20, 20));

final iEthic = Aspect(name: "Белая этика", altName: "Интровертная этика (Рациональная)", icon: getIcon(EthicIcon(color: Colors.white), 20, 20));

final iIntuition =
Aspect(name: "Белая интуиция", altName: "Интровертная интуиция (Иррациональная)", icon: getIcon(IntuitionIcon(color: Colors.white), 20, 20));

final iLogic = Aspect(name: "Белая логика", altName: "Интровертная логика (Рациональная)", icon: getIcon(LogicIcon(color: Colors.white), 20, 20));

final introvertSensoric = AspectDictionary(name: "Интровертная сенсорика", subDictionaries: <SubDictionary>[
  SubDictionary(name: "Способ словесного выражения (лексика, грамматика, речевые конструкторы)", themes: <SemanticTheme>[
    SemanticTheme(name: "Информация, получаемая от органов чувств, собственного тела", subThemes: <SubSemanticTheme>[
      SubSemanticTheme(name: "Вкус и обоняние", words: [
        "аромат, ароматный",
        "благоухает",
        "вкус (в т.ч. в переносном смысле)",
        "послевкусие, вкусный, не вкусный",
        "портить вкус, привкус",
        "воняет, вонь, вонючий",
        "запах, пахнуть",
        "нюхать, понюхать",
        "пробовать, попробовать",
        "протухать, протухший",
        "свежий - несвежий, освежить",
        "смаковать, смак",
        "спелый - неспелый",
        "\"за ушами трещит\"",
        "\"пальчики оближешь\"",
        "сладкий",
        "соленый",
        "горький",
        "кислый",
        "безвкусный",
        "язык, на языке",
        "острый",
        "\"кайф вкусное слово\""
      ]),
      SubSemanticTheme(name: "Оттенки вкусов и запахов", words: [
        "вяжущий",
        "горько-кислый",
        "горьковатый" "\"запах щенка отличается от запаха псины. Псина - эта запах шерсти\"",
        "затхлый",
        "карамельный (запах)",
        "кисло-сладкий",
        "кислый, как лимон",
        "липко-сладкий",
        "медовый",
        "\"металлический привкус\"",
        "насыщенно(ый)",
        "оттенок",
        "пахнет свежезаваренным чаем и сдобными булочками",
        "\"плесневелый вкус\"",
        "пресный",
        "приторно-сладкий",
        "\"разжевать до получения нужного вкусового оттенка\"",
        "сводит челюсти",
        "с душком",
        "сильно(ый)",
        "слабо(ый)",
        "сладковатый",
        "смердит, смрад",
        "терпкий",
        "яркий (ярко выраженный) вкус"
      ]),
      SubSemanticTheme(name: "Осязание, тактильные ощущения", words: [
        "влажный, влажность",
        "гладит, гладкий",
        "горячий",
        "жесткий",
        "жжет",
        "жирный (на ощупь)",
        "жмет",
        "клейкий (почки на березе)",
        "кожа, всей кожей",
        "колет, колкий, колючий",
        "липнет, липкий",
        "мохнатый",
        "мягкий, мягкость",
        "обжечься",
        "острый",
        "ощутить, ощущение, ощущение влажность, свежести и т.д.",
        "печет",
        "порезаться",
        "промочить ноги",
        "прохлада(ый), охладить",
        "пушистый",
        "сальный",
        "твердый",
        "теплый",
        "трет",
        "упругий",
        "холодить, холодный, холод",
        "царапает",
        "шероховатый",
        "шершавый",
        "шкрябает",
        "цокочет",
        "\"ботинки натирают, а не трут\""
      ]),
      SubSemanticTheme(name: "Физический контакт", words: [
        "брать",
        "весить, взвесить на руке, невесомый",
        "взять (нежно, бережно)",
        "держать",
        "жамкать",
        "касаться, прикасаться, касание, прикосновение, соприкосновение",
        "лапать",
        "обнять",
        "отпускать",
        "повертеть",
        "погладить, поглаживать",
        "потереть, растереть",
        "потрогать",
        "поцеловать",
        "почмокать",
        "пощекотать",
        "пощупать, на ощупь, нащупать",
        "приласкать",
        "приятно подержать в руках",
        "тискать, потискать",
        "чесать, почесывать"
      ]),
      SubSemanticTheme(name: "Оттенок прикосновения", words: ["как железо", "легкое прикосновение", "мягкий, как пух", "холодный, как лед"]),
      SubSemanticTheme(name: "Память на ощущения, вкусы, запахи", words: ["\"как сейчас помню запах свежескошенной травы на том поле\""]),
    ]),
    SemanticTheme(name: "Ощущения", subThemes: <SubSemanticTheme>[
      SubSemanticTheme(name: "Основная", words: []),
      SubSemanticTheme(name: "Тело", words: []),
      SubSemanticTheme(name: "Конкретизация ощущения по месту", words: []),
      SubSemanticTheme(name: "Внутренние и мышечные ощущения", words: []),
      SubSemanticTheme(name: "Физиологические процессы", words: []),
    ]),
    SemanticTheme(name: "Поза, смена позы", subThemes: <SubSemanticTheme>[SubSemanticTheme(name: "Основная", words: [])]),
    SemanticTheme(name: "Потребности и их удовлетворение", subThemes: <SubSemanticTheme>[
      SubSemanticTheme(name: "Основная", words: []),
      SubSemanticTheme(name: "Еда", words: []),
      SubSemanticTheme(name: "Питье (выпивка)", words: []),
      SubSemanticTheme(name: "Секс", words: []),
      SubSemanticTheme(name: "Здоровье", words: []),
      SubSemanticTheme(name: "Чистота", words: []),
    ]),
    SemanticTheme(name: "Физические свойства", subThemes: <SubSemanticTheme>[
      SubSemanticTheme(name: "Основная", words: []),
      SubSemanticTheme(name: "Косистенция", words: []),
      SubSemanticTheme(name: "Изменение физических свойств любого объекта", words: []),
    ]),
    SemanticTheme(name: "Среда обитания", subThemes: <SubSemanticTheme>[
      SubSemanticTheme(name: "Основная", words: []),
      SubSemanticTheme(name: "Оттенки цветов", words: []),
      SubSemanticTheme(name: "Одежда", words: []),
    ]),
  ])
]);

final iSensoric =
Aspect(name: "Белая сенсорика", altName: "Интровертная сенсорика (Иррациональная)", icon: getIcon(SensoricIcon(color: Colors.white), 20, 20));

class Aspect {
  String name;
  String altName;
  Widget icon;
  String tag;

  Aspect({this.name, this.altName, this.icon}) {
    tag = this.name;
  }
}

class AspectDictionary {
  String name;
  List<SubDictionary> subDictionaries;

  AspectDictionary({@required this.name, this.subDictionaries});
}

class SemanticTheme {
  String name;
  List<SubSemanticTheme> subThemes;

  SemanticTheme({@required this.name, this.subThemes});
}

class SubDictionary {
  String name;
  List<SemanticTheme> themes;

  SubDictionary({@required this.name, this.themes});
}

class SubSemanticTheme {
  String name;
  List<String> words;

  SubSemanticTheme({@required this.name, this.words});
}

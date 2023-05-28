import '../models/sign.dart';
import '../models/relation.dart';

class TypeDesc {
  final String tag;
  final String shortName;
  final String longName;
  final String altName;
  final String nameDescription;
  final String mbti;
  final String moto;
  final String svg;
  final String jpg;
  final String png;
  final String routeName;
  final String description;
  final String strongTypeDesc;
  final String roleTypeDesc;
  final String weakTypeDesc;
  final String bestPractice;
  final String worstPractice;
  final String forEffectiveWork;

  final bool extraversion;
  final bool logic;
  final bool intuition;
  final bool rationalization;

  final List<Relation> relations;
  final List<Sign> signs;

  const TypeDesc(
      {required this.tag,
      required this.shortName,
      required this.longName,
      required this.altName,
      required this.nameDescription,
      required this.mbti,
      required this.moto,
      required this.svg,
      required this.jpg,
      required this.png,
      required this.routeName,
      required this.description,
      required this.strongTypeDesc,
      required this.roleTypeDesc,
      required this.weakTypeDesc,
      required this.bestPractice,
      required this.worstPractice,
      required this.forEffectiveWork,
      required this.extraversion,
      required this.logic,
      required this.intuition,
      required this.rationalization,
      required this.relations,
      required this.signs})
      : super();

  @override
  String toString() {
    return this.shortName;
  }
}

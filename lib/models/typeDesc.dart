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
      {this.tag,
      this.shortName,
      this.longName,
      this.altName,
      this.nameDescription,
      this.mbti,
      this.moto,
      this.svg,
      this.jpg,
      this.png,
      this.routeName,
      this.description,
      this.strongTypeDesc,
      this.roleTypeDesc,
      this.weakTypeDesc,
      this.bestPractice,
      this.worstPractice,
      this.forEffectiveWork,
      this.extraversion,
      this.logic,
      this.intuition,
      this.rationalization,
      this.relations,
      this.signs})
      : super();

  @override
  String toString() {
    return this.shortName;
  }
}

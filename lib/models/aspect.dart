import 'package:flutter/material.dart';

import 'aspectDictionary.dart';

class Aspect {
  String name;
  String altName;
  Widget icon;
  String tag = "";
  String desc;
  List<String> func;
  AspectDictionary dictionary;

  Aspect(
      {required this.name,
      required this.altName,
      required this.icon,
      required this.desc,
      required this.func,
      required this.dictionary}) {
    tag = this.name;
  }
}

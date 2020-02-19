import 'package:flutter/material.dart';

import 'aspectDictionary.dart';

class Aspect {
  String name;
  String altName;
  Widget icon;
  String tag;
  String desc;
  List<String> func;
  AspectDictionary dictionary;

  Aspect(
      {this.name,
      this.altName,
      this.icon,
      this.desc,
      this.func,
      this.dictionary}) {
    tag = this.name;
  }
}

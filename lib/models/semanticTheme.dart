import 'package:flutter/material.dart';

class SemanticTheme {
  String name;
  List<SubSemanticTheme> subThemes;

  SemanticTheme({required this.name, required this.subThemes});
}

class SubSemanticTheme {
  String name;
  List<String> words;

  SubSemanticTheme({required this.name, required this.words});
}

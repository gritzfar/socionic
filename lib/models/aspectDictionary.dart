import 'package:flutter/material.dart';

import 'semanticTheme.dart';

class AspectDictionary {
  String name;
  List<SemanticTheme> semanticThemes;

  AspectDictionary({required this.name, required this.semanticThemes});

  //List<SemanticTheme> filteredThemes;

  List<SemanticTheme> applyFilter(String filter) {
    if (filter.isEmpty) {
      return semanticThemes;
    }

    List<SemanticTheme> result = <SemanticTheme>[];
    for (var theme in semanticThemes) {
      var newTheme = new SemanticTheme(name: theme.name, subThemes: <SubSemanticTheme>[]);
      newTheme.subThemes = <SubSemanticTheme>[];

      for (var subTheme in theme.subThemes) {
        var newSubTheme = new SubSemanticTheme(name: subTheme.name, words: <String>[]);

        for (var word in subTheme.words) {
          if (word.contains(filter)) {
            newSubTheme.words.add(word);
          }
        }

        if (newSubTheme.words.length > 0) {
          newTheme.subThemes.add(newSubTheme);
        }
      }

      if (newTheme.subThemes.length > 0) {
        result.add(newTheme);
      }
    }

    return result;
  }
}

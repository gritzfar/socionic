class Dichotomie {
  bool? value;
  final String falseValue;
  final String trueValue;

  Dichotomie({required this.falseValue, required this.trueValue});

  @override
  String toString() {
    if (value == null) return "";

    return (value ?? false) ? this.trueValue : this.falseValue;
  }
}

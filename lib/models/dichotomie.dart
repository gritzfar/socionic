class Dichotomie {
  bool value;

  final String falseValue;
  final String trueValue;

  Dichotomie({this.falseValue, this.trueValue}) : super();

  @override
  String toString() {
    if (value == null) return "";

    return value ? this.trueValue : this.falseValue;
  }
}

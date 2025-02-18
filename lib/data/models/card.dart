import 'package:sets/data/models/card_pattern.dart';

class Card {
  late CardPattern pattern;

  Card(this.pattern);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Card && pattern == other.pattern);

  @override
  int get hashCode => pattern.hashCode;
}

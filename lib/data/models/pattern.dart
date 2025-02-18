import '../enums/card_enums.dart';

class Pattern {
  late Count count;
  late Fill fill;
  late Color color;
  late Shape shape;

  Pattern(this.count, this.fill, this.color, this.shape);
}

class Patterns {
  late List<Count> counts;
  late List<Fill> fills;
  late List<Color> colors;
  late List<Shape> shapes;

  Patterns(this.counts, this.fills, this.colors, this.shapes);
}

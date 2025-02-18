import '../enums/color.dart';
import '../enums/count.dart';
import '../enums/fill.dart';
import '../enums/shape.dart';

class Patterns {
  late List<Count> counts;
  late List<Fill> fills;
  late List<Color> colors;
  late List<Shape> shapes;

  Patterns(this.counts, this.fills, this.colors, this.shapes);
}

import '../enums/color.dart';
import '../enums/count.dart';
import '../enums/fill.dart';
import '../enums/shape.dart';

class Pattern {
  late Count count;
  late Fill fill;
  late Color color;
  late Shape shape;

  Pattern(this.count, this.fill, this.color, this.shape);
}

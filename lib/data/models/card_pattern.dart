import '../enums/color.dart';
import '../enums/count.dart';
import '../enums/fill.dart';
import '../enums/shape.dart';

class CardPattern {
  Count? count;
  Fill? fill;
  Color? color;
  Shape? shape;

  CardPattern({
    required this.count,
    required this.fill,
    required this.color,
    required this.shape,
  });

  CardPattern.empty();
}

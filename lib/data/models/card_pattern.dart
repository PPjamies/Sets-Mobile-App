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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardPattern &&
          other.count == count &&
          other.fill == fill &&
          other.color == color &&
          other.shape == shape);

  @override
  int get hashCode =>
      count.hashCode ^ fill.hashCode ^ color.hashCode ^ shape.hashCode;
}

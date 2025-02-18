import '../enums/color.dart';
import '../enums/count.dart';
import '../enums/fill.dart';
import '../enums/shape.dart';
import '../models/patterns.dart';

final int CLASSIC_DECK_SIZE = 81;
final int CLASSIC_DEAL_SIZE = 12;
final int CLASSIC_DRAW_SIZE = 3;

final Patterns CLASSIC_PATTERNS = Patterns(
  [Count.one, Count.two, Count.three],
  [Fill.blank, Fill.dash, Fill.solid],
  [Color.red, Color.green, Color.purple],
  [Shape.diamond, Shape.squiggle, Shape.oval],
);

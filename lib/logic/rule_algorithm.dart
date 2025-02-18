import 'package:sets/data/models/Deck.dart';
import 'package:sets/data/models/card_patterns.dart';

import '../data/models/card.dart';
import '../data/models/card_pattern.dart';
import 'package:collection/collection.dart';

bool isSet(Deck deck, List<Card> cards) {
  if (cards.isEmpty || cards.length < 3) {
    return true;
  }

  // 2nd card establishes rules
  CardPattern firstPattern = cards[0].pattern;
  CardPattern secondPattern = cards[1].pattern;

  CardPattern expectedThirdPattern = _computeExpectedThirdPattern(
    deck,
    firstPattern,
    secondPattern,
  );
  CardPattern thirdPattern = cards[2].pattern;

  return DeepCollectionEquality().equals(expectedThirdPattern, thirdPattern);
}

CardPattern _computeExpectedThirdPattern(
  Deck deck,
  CardPattern a,
  CardPattern b,
) {
  CardPatterns patterns = deck.patterns;
  return CardPattern(
    count:
        a.count == b.count
            ? a.count
            : patterns.counts.firstWhere((c) => c != a.count && c != b.count),
    fill:
        a.fill == b.fill
            ? a.fill
            : patterns.fills.firstWhere((f) => f != a.fill && f != b.fill),
    color:
        a.color == b.color
            ? a.color
            : patterns.colors.firstWhere((c) => c != a.color && c != b.color),
    shape:
        a.shape == b.shape
            ? a.shape
            : patterns.shapes.firstWhere((s) => s != a.shape && s != b.shape),
  );
}

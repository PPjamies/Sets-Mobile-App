import 'package:sets/data/enums/deck_type.dart';
import 'package:sets/data/models/card.dart';
import 'package:sets/data/models/card_pattern.dart';
import 'package:sets/data/models/card_patterns.dart';

import '../constants/deck_constants.dart';

class Deck {
  late DeckVersion version;
  late CardPatterns patterns;
  late int deckSize;
  late int dealSize;
  late int drawSize;

  List<Card> originalDeck = [];
  List<Card> deck = [];

  void setVersion(DeckVersion version) {
    switch (version) {
      case DeckVersion.classic:
        this.version = version;
        this.deckSize = CLASSIC_DECK_SIZE;
        this.dealSize = CLASSIC_DEAL_SIZE;
        this.drawSize = CLASSIC_DRAW_SIZE;
        this.patterns = CLASSIC_PATTERNS;
    }
  }

  void init() {
    if (originalDeck.isEmpty) {
      for (var count in patterns.counts) {
        for (var fill in patterns.fills) {
          for (var color in patterns.colors) {
            for (var shape in patterns.shapes) {
              originalDeck.add(
                Card(
                  CardPattern(
                    count: count,
                    fill: fill,
                    color: color,
                    shape: shape,
                  ),
                ),
              );
            }
          }
        }
      }
    }

    if (originalDeck.length != deckSize) {
      throw Exception(
        "Original deck does not match up with the expected deck size!",
      );
    }

    if (originalDeck.length < dealSize) {
      throw Exception(
        "Deal size is greater than the number of cards in the deck!",
      );
    }

    deck.clear();
    deck.addAll(originalDeck);
    deck.shuffle();
  }

  List<Card>? deal(bool isInitialDealing) {
    int size = drawSize;

    if (isInitialDealing) {
      init();
      size = dealSize;
    }

    if (deck.isEmpty || deck.length < size) return null; // <--- no more cards

    List<Card> cards = deck.sublist(0, size);
    deck.removeRange(0, size);
    return cards;
  }
}

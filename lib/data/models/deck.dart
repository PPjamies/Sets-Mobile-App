import 'package:sets/data/enums/card_enums.dart';
import 'package:sets/data/models/card.dart';
import 'package:sets/data/models/pattern.dart';

final int CLASSIC_DECK_SIZE = 81;
final int CLASSIC_DEAL_SIZE = 12;
final int CLASSIC_DRAW_SIZE = 3;
final Patterns CLASSIC_PATTERNS = Patterns(
  [Count.one, Count.two, Count.three],
  [Fill.blank, Fill.dash, Fill.solid],
  [Color.red, Color.green, Color.purple],
  [Shape.diamond, Shape.squiggle, Shape.oval],
);

class Deck {
  late DeckVersion version;
  late Patterns patterns;
  late int deckSize;
  late int dealSize;
  late int drawSize;

  List<Card> originalDeck = []; // <--- once initialized this does not change
  List<Card> deck = []; // <--- people play with this deck

  void setVersion(DeckVersion version) {
    this.version = version;

    switch (version) {
      case DeckVersion.classic:
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
              originalDeck.add(Card(Pattern(count, fill, color, shape)));
            }
          }
        }
      }
    }

    // todo: create custom exception handler
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

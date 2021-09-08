import 'package:f_set/modules/game/set_card_widget.dart';
import 'package:f_set/set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:supercharged/supercharged.dart';

class CardGrid extends HookWidget {
  const CardGrid({
    Key? key,
    required this.cards,
    required this.highlightedCards,
    required this.onCardPressed,
  }) : super(key: key);

  final List<SetCard?> cards;
  final List<SetCard?> highlightedCards;
  final Function(SetCard) onCardPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      clipBehavior: Clip.none,
      shrinkWrap: true,
      childAspectRatio: 2 / 3,
      crossAxisCount: 3,
      children: List.generate(
        cards.length,
        (int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: 250.milliseconds,
            delay: 100.milliseconds,
            columnCount: 3,
            child: CardAppearAnimation(
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onCardPressed(cards[index]!);
                    },
                    child: Builder(
                      builder: (context) {
                        final card = cards[index];

                        if (card == null) {
                          return const EmptyCard();
                        }

                        return SetCardWidget(
                          card: card,
                          duration: 100.seconds,
                          highlight: highlightedCards.contains(cards[index]),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardAppearAnimation extends StatelessWidget {
  const CardAppearAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      scale: 0.95,
      duration: 750.milliseconds,
      curve: Curves.easeOutCubic,
      child: FadeInAnimation(
        curve: Curves.easeOutCubic,
        child: child,
      ),
    );
  }
}

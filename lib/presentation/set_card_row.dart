import 'package:f_set/modules/game/card_grid.dart';
import 'package:f_set/modules/game/set_card_widget.dart';
import 'package:f_set/set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SetCardRow extends StatelessWidget {
  const SetCardRow({Key? key, required this.cards, this.onCardPressed}) : super(key: key);

  final List<SetCard?> cards;
  final Function(SetCard)? onCardPressed;

  @override
  Widget build(BuildContext context) {
    assert(cards.length <= 3, 'More than 3 cards were given.');

    return AnimationLimiter(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: AnimationConfiguration.toStaggeredList(
          childAnimationBuilder: (child) => Flexible(
            child: CardAppearAnimation(child: child),
          ),
          children: List.generate(
            3,
            (index) => Builder(
              builder: (context) {
                if (cards.length <= index || cards[index] == null) {
                  return const EmptyCard(
                    borderWidth: 0.5,
                  );
                }

                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => onCardPressed?.call(cards[index]!),
                  child: SetCardWidget(
                    card: cards[index]!,
                    highlight: cards.isSet,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

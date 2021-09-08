Flutter is cool and all, but on itself it can quickly get complicated/boilerplaty.

StatefulWidget
InheritedWidget .. even 2 year old Widget of the Week video suggests `Provider`


Warning beforehand: Flutter is more verbose. It can be daunting at first to look at code.
But it is also more straightforward, the intention is clearer (MainAxisAlignment, CrossAxisAlignment)


Talk about
1. Cubit
   1. context.select / context.read
2. freezed
3. Hooks

Exercises

1. StaggeredAnimation of the grid
2. LoadableResource/ApiService - High scores
3. +3 card. 
   1. AnimatedOpacity
   2. IgnorePointer or Cubit handles board having 15 cards





leírás

persistency




dart featurek

extension funct, 
..

code generation (hiding them)
pubspec.yaml -> package.json



What you'll learn
- Animations
- State management
- Load and display data




HighScoresScreen

- "forget" to emit fethcing
- "forget" to add Cubit on GSD
- Wrap hole `when` in Column, 
  - shrinkWrap
  - SafeArea
  - Staggered animation
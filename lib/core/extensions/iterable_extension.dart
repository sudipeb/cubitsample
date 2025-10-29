import 'dart:math' as math show Random;

extension RandomElement<T> on Iterable<T> {
  //getting random index number from the list
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

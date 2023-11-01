import 'dart:math';

extension ListExtensions<T> on List<T> {
  T? getRandomElement() {
    if (isEmpty) return null;
    Random random = Random();
    return this[random.nextInt(length)];
  }
}

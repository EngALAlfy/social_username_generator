import 'dart:math';

extension ListExtensions<T> on List<T> {
  T? getRandomElement() {
    if (isEmpty) return null;
    Random random = Random();
    return this[random.nextInt(length)];
  }
}

extension LtringExtensions on String {
  String getRandomChar() {
    if (isEmpty) return "";
    Random random = Random();
    return this[random.nextInt(length)];
  }
}

import 'dart:math';

extension ListExtensions<T> on List<T> {
  T? getRandomElement() {
    if (isEmpty) return null;
    Random random = Random();
    return this[random.nextInt(length)];
  }
}

extension StringExtensions on String {
  String getRandomChar() {
    if (isEmpty) return "";
    Random random = Random();
    return this[random.nextInt(length)];
  }
}

extension MapExtensions on Map {
  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;

}

import 'dart:math';

abstract class Helpers {
  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/id/$randomInt/300/300';
  }

  static DateTime randomDate() {
    final random = Random();
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(days: random.nextInt(20000)));
  }
}

import 'package:fibonacci/models/fibonacci.dart';

class FibonacciGenerator {
  static List<FibonacciModel> generateSequence(int count) {
    List<FibonacciModel> items = [];
    int a = 0, b = 1;

    for (int i = 0; i < count; i++) {
      ItemType type;
      if ([0, 4, 8, 12].contains(i)) {
        type = ItemType.circle;
      } else if ([1, 7, 9, 10, 15, 17].contains(i)) {
        type = ItemType.square;
      } else if ([2, 5, 6, 11, 13, 14].contains(i)) {
        type = ItemType.cross;
      } else {
        type = ItemType.square;
      }

      items.add(FibonacciModel(
        index: i,
        number: a,
        type: type,
      ));

      int temp = a + b;
      a = b;
      b = temp;
    }

    return items;
  }
}

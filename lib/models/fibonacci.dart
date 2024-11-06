class FibonacciModel {
  final int index;
  final int number;
  final ItemType type;
  bool isHighlighted;
  bool isSource;
  bool isSelected;

  FibonacciModel({
    required this.index,
    required this.number,
    required this.type,
    this.isHighlighted = false,
    this.isSource = false,
    this.isSelected = false,
  });
}

enum ItemType { circle, square, cross }

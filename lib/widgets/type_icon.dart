import 'package:fibonacci/models/fibonacci.dart';
import 'package:flutter/material.dart';

class TypeIcon extends StatelessWidget {
  final ItemType type;

  const TypeIcon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ItemType.circle:
        return Container(
          width: 15,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        );
      case ItemType.square:
        return Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
        );
      case ItemType.cross:
        return const SizedBox(
          width: 30,
          height: 24,
          child: Icon(Icons.close, size: 20),
        );
    }
  }
}

import 'package:fibonacci/models/fibonacci.dart';
import 'package:fibonacci/widgets/type_icon.dart';
import 'package:flutter/material.dart';

class FibonacciItemTile extends StatelessWidget {
  final FibonacciModel item;
  final VoidCallback onTap;
  final Color backgroundColor;

  const FibonacciItemTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        // Remove leading property
        // Add trailing property (previously leading)
        trailing: TypeIcon(type: item.type),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Index: ${item.index}, Number: ${item.number}',
            style: const TextStyle(fontSize: 14),
          ),
        ),
        visualDensity: VisualDensity.compact,
        onTap: onTap,
      ),
    );
  }
}

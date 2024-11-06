import 'package:fibonacci/models/fibonacci.dart';
import 'package:fibonacci/widgets/fibonacci_item_title.dart';
import 'package:flutter/material.dart';

class FibonacciBottomSheet extends StatefulWidget {
  final List<FibonacciModel> items;
  final Function(FibonacciModel) onItemSelected;

  const FibonacciBottomSheet({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<FibonacciBottomSheet> createState() => _FibonacciBottomSheetState();
}

class _FibonacciBottomSheetState extends State<FibonacciBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return FibonacciItemTile(
                  item: item,
                  backgroundColor: item.isSelected
                      ? Colors.green.shade500
                      : Colors.transparent,
                  onTap: () async {
                    setState(() {
                      for (var i in widget.items) {
                        i.isSelected = false;
                      }
                      item.isSelected = true;
                    });

                    await Future.delayed(const Duration(milliseconds: 300));
                    widget.onItemSelected(item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

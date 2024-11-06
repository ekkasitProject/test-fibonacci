import 'package:fibonacci/models/fibonacci.dart';
import 'package:fibonacci/utils/fibonacci_generator.dart';
import 'package:fibonacci/widgets/fibonacci_bottom_sheet.dart';
import 'package:fibonacci/widgets/fibonacci_item_title.dart';
import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({super.key});

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  final List<FibonacciModel> _items = [];
  final ScrollController _scrollController = ScrollController();
  FibonacciModel? _sourceItem;

  @override
  void initState() {
    super.initState();
    _items.addAll(FibonacciGenerator.generateSequence(40));
  }

  Color _getItemColor(FibonacciModel item) {
    if (item.isSource) {
      return Colors.red.shade500;
    } else if (item.isSelected) {
      return Colors.green.shade500;
    } else if (item.isHighlighted) {
      return Colors.yellow.shade100;
    }
    return Colors.transparent;
  }

  Future<void> _scrollToItem(int index) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (_scrollController.hasClients) {
      final itemPosition = index * 48.0;
      final screenHeight = MediaQuery.of(context).size.height;
      final scrollPosition = itemPosition - (screenHeight / 2) + 24.0;

      await _scrollController.animateTo(
        scrollPosition.clamp(0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _showBottomSheet(FibonacciModel sourceItem) {
    setState(() {
      // Reset all items
      for (var item in _items) {
        item.isSource = false;
        item.isSelected = false;
        item.isHighlighted = false;
      }
      // Mark source item
      sourceItem.isSource = true;
      _sourceItem = sourceItem;
    });

    final filteredItems =
        _items.where((item) => item.type == sourceItem.type).toList();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FibonacciBottomSheet(
          items: filteredItems,
          onItemSelected: (selectedItem) {
            Navigator.pop(context);
            setState(() {
              selectedItem.isHighlighted = true;
              if (_sourceItem != null) {
                _sourceItem!.isSource = false;
              }
            });
            _scrollToItem(_items.indexOf(selectedItem));
          },
        );
      },
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return FibonacciItemTile(
            item: item,
            backgroundColor: _getItemColor(item),
            onTap: () => _showBottomSheet(item),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

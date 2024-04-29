import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoPicker extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final void Function(dynamic) onChange;
  final String title;
  final dynamic value;
  final Color? cardColor;
  final bool disabled;
  final dynamic initialValue;

  const CustomCupertinoPicker({
    Key? key,
    required this.items,
    required this.onChange,
    required this.title,
    required this.value,
    this.initialValue,
    this.cardColor,
    this.disabled = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCupertinoPickerState createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  int _selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      final index = widget.items
          .indexWhere((item) => item['value'] == widget.initialValue);
      if (index != -1) {
        _selectedItemIndex = index;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey[800], fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: widget.disabled ? null : _showPicker,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Colors.black26,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(9.0),
              child: Text(
                widget.items[_selectedItemIndex]['label'],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 256,
          padding: const EdgeInsets.only(top: 6.0),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: CupertinoPicker(
            itemExtent: 32,
            scrollController:
                FixedExtentScrollController(initialItem: _selectedItemIndex),
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedItemIndex = index;
              });
              widget.onChange(widget.items[index]['value']);
            },
            children: List<Widget>.generate(
              widget.items.length,
              (int index) {
                return Center(
                  child: Text(
                    widget.items[index]['label'],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

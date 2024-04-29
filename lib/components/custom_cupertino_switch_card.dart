import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoSwitchCard extends StatelessWidget {
  final String title;
  final bool value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  final String? description;
  final bool boldTitle;

  const CustomCupertinoSwitchCard({
    required this.title,
    required this.value,
    this.activeColor,
    this.onChanged,
    this.description,
    this.boldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: this.boldTitle
          ? Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          : Text(this.title),
      subtitle: Text(
        this.description ?? "",
        style:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700),
      ),
      trailing: CupertinoSwitch(
        value: this.value,
        onChanged: this.onChanged,
        activeColor: this.activeColor ?? CupertinoColors.activeBlue,
      ),
    );
  }
}

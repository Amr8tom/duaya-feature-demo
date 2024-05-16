import 'package:duaya_app/utils/constants/exports.dart';
import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key, required this.textWidget, required this.onSelected});

  final Widget textWidget;
  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: textWidget,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: '+20',
          child: Text('+20'),
        ),
        const PopupMenuItem<String>(
          value: '+966',
          child: Text('+966'),
        ),
        // Add more country codes as needed
      ],
    );
  }
}

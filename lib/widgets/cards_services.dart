import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class CardsServices extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final bool? selectedButton;
  const CardsServices({Key? key, this.onTap, this.icon, this.selectedButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: selectedButton == false ? Colors.grey : Colors.amber),
            child: Icon(
              icon,
              size: 45,
            ),
          ),
        ));
  }
}

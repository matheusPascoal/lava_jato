import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

class CardsServices extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;

  const CardsServices({Key? key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(4)),
            child: child,
          ),
        ));
  }
}

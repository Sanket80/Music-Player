import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
            offset: const Offset(-3, -3),
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}

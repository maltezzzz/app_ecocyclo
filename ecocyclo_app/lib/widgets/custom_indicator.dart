import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final int activeIndex;
  final int total;

  const CustomIndicator({
    super.key,
    required this.activeIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: index == activeIndex ? Colors.teal[400] : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

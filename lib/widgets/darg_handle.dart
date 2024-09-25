import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 180).copyWith(top: 16),
      color: Colors.grey,
    );
  }
}

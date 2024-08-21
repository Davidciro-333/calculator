import 'package:calculator/app/view/components/button_operation.dart';
import 'package:flutter/material.dart';

class RowOperation extends StatelessWidget {
  const RowOperation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /*ButtonOperation(opButton: Icons.clear),
        Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(opButton: Icons.backspace),
        Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(opButton: Icons.add),
        Padding(padding: EdgeInsets.only(right: 0)),
        ButtonOperation(opButton: Icons.remove),*/
      ],
    );
  }
}

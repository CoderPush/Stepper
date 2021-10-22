import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0.0,
      backgroundColor: orange,
      child: const Icon(Icons.add),
    );
  }
}

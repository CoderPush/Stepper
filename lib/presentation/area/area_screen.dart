import 'package:flutter/material.dart';
import 'package:stepper/presentation/common/common_widgets.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
      drawer: MainDrawer(),
    );
  }
}

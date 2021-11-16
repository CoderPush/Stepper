import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';

class ClearDataView extends StatelessWidget {
  const ClearDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(incomingFeature),
          duration: Duration(milliseconds: 1000),
        ));
      },
      child: Container(
        margin:
            const EdgeInsets.only(left: twenty, right: twenty, bottom: twenty),
        padding: const EdgeInsets.symmetric(vertical: twelve),
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueGrey,
          borderRadius: BorderRadius.circular(largeBorderRadius),
        ),
        child: const Center(
          child: Text(
            clearData,
            style: TextStyle(color: orange, fontSize: seventeen),
          ),
        ),
      ),
    );
  }
}

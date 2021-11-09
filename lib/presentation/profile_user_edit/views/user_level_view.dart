import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  UserLevelView({Key? key}) : super(key: key);

  final List<String> _professionList = [
    'Software Engineer 1',
    'Software Engineer 2',
    'Software Engineer 3',
    'Software Engineer 4',
    'Software Engineer 5',
  ];

  final List<String> _bandList = [
    'Band 1',
    'Band 2',
    'Band 3',
    'Band 4',
    'Band 5',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: twenty, right: twenty),
      padding: const EdgeInsets.symmetric(vertical: sixteen, horizontal: twenty),
      height: screenSize.width * 0.32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowLevelView(titleText: 'Profession', list: _professionList),
          RowLevelView(titleText: 'Band', list: _bandList),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/model/profession/profession_item_model.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  final List<ProfessionItemModel> professions;
  final List<BandItemModel> bands;

  const UserLevelView({
    required this.professions,
    required this.bands,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: twenty, right: twenty),
      padding: const EdgeInsets.symmetric(vertical: sixteen, horizontal: twenty),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RowLevelView(titleText: profession, list: professionList),
          const SizedBox(height: twenty),
          RowLevelView(titleText: band, list: bandList),
        ],
      ),
    );
  }
}

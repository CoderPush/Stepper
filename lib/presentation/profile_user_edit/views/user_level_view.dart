import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/band/band_model.dart';
import 'package:stepper/data/model/profession/profession_model.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  final ProfessionModel profession;
  final BandModel band;

  const UserLevelView({
    required this.profession,
    required this.band,
    Key? key,
  }) : super(key: key);

  List<String> _getProfessionNames() {
    List<String> professionNames = [];
    for (var professionItem in profession.professions) {
      professionNames.add(professionItem.professionName);
    }
    return professionNames;
  }

  List<String> _getBandNames() {
    List<String> bandNames = [];
    for (var bandItem in band.bands) {
      bandNames.add(bandItem.bandName);
    }
    return bandNames;
  }

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
          RowLevelView(titleText: professionText, list: _getProfessionNames()),
          const SizedBox(height: twenty),
          RowLevelView(titleText: bandText, list: _getBandNames()),
        ],
      ),
    );
  }
}

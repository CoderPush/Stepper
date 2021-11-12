import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/model/band/band_model.dart';
import 'package:stepper/data/model/profession/profession_model.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  final BandModel band;
  final ProfessionModel profession;
  final ProfileUserEditCubit profileUserEditCubit;

  const UserLevelView({
    required this.band,
    required this.profession,
    required this.profileUserEditCubit,
    Key? key,
  }) : super(key: key);

  // Private Methods
  List<String> _getProfessionNames() {
    List<String> professionNames = [];
    for (var professionItem in profession.professions) {
      professionNames.add(professionItem.professionName);
    }
    return professionNames;
  }

  List<String> _getBandNames() {
    List<String> bandNames = [];
    List<String> bandIds = [];

    for (var professionItem in profession.professions) {
      bandIds = professionItem.bandIds;
    }

    for (var bandId in bandIds) {
      for (var bandItem in band.bands) {
        if (bandId == bandItem.bandId) {
          bandNames.add(bandItem.bandName);
        }
      }
    }

    return bandNames;
  }

  List<BandItemModel> _getBands() {
    List<BandItemModel> bands = [];
    List<String> bandIds = [];

    for (var professionItem in profession.professions) {
      bandIds = professionItem.bandIds;
    }

    for (var bandId in bandIds) {
      for (var bandItem in band.bands) {
        if (bandId == bandItem.bandId) {
          bands.add(bandItem);
        }
      }
    }

    return bands;
  }

  @override
  Widget build(BuildContext context) {
    final professionNames = _getProfessionNames();
    final bandNames = _getBandNames();
    final bands = _getBands();

    // Save Default Band Model Item
    profileUserEditCubit.saveBandModelItem(bands.first);

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
          RowLevelView(
            titleText: professionText,
            value: engineer,
            list: professionNames,
            onChanged: (professionName) {},
          ),
          const SizedBox(height: twenty),
          StreamBuilder<String>(
              initialData: bandNames.first,
              stream: profileUserEditCubit.bandDropDownStream,
              builder: (context, snapshot) {
                return RowLevelView(
                  titleText: bandText,
                  value: snapshot.data!,
                  list: bandNames,
                  onChanged: (bandName) {
                    if (bandName == null) return;

                    // Trigger change band name
                    profileUserEditCubit.onChangedBandDropDown(bandName);

                    // Save Current Band Item Model
                    final currentIndexBands = bandNames.indexOf(bandName);
                    final currentBandItemModel = bands[currentIndexBands];
                    profileUserEditCubit.saveBandModelItem(currentBandItemModel);
                  },
                );
              }),
        ],
      ),
    );
  }
}

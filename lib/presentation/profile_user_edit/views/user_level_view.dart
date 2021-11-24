import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/profile_user_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  const UserLevelView({Key? key}) : super(key: key);

  _onProfessionChange(String professonName, BuildContext context) {
    context.read<ProfileUserEditCubit>().onProfessionChanged(professonName);
  }

  _onBandChange(String bandName, BuildContext context) {
    context.read<ProfileUserEditCubit>().onBandChanged(bandName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: twenty, right: twenty),
      padding:
          const EdgeInsets.symmetric(vertical: sixteen, horizontal: twenty),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: BlocBuilder<ProfileUserEditCubit, ProfileUserEditState>(
        builder: (context, state) {
          if (state is ProfileUserEditInSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowLevelView(
                  titleText: professionText,
                  value: state.selectedProfession,
                  list: state.professionList
                      .map((profession) => profession.professionName)
                      .toList(),
                  onChanged: (professionName) =>
                      _onProfessionChange(professionName, context),
                ),
                const SizedBox(height: twenty),
                RowLevelView(
                  titleText: bandText,
                  value: state.selectedBand.bandName,
                  list: state.bandList.map((band) => band.bandName).toList(),
                  onChanged: (bandName) => _onBandChange(bandName, context),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

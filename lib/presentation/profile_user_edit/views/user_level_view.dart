import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_state.dart';
import 'package:stepper/presentation/profile_user_edit/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  const UserLevelView({Key? key}) : super(key: key);

  _onProfessionChange(String professonName, BuildContext context) {
    context
        .read<UserProfileEditCubit>()
        .onProfessionChanged(professionName: professonName);
  }

  _onBandChange(String bandName, BuildContext context) async {
    context.read<UserProfileEditCubit>().onBandChanged(bandName: bandName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(left: twenty, right: twenty),
      padding:
          const EdgeInsets.symmetric(vertical: sixteen, horizontal: twenty),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueGrey,
        borderRadius: BorderRadius.circular(largeBorderRadius),
      ),
      child: BlocBuilder<UserProfileEditCubit, UserProfileEditState>(
        builder: (context, state) {
          if (state.fetchingStatus == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.fetchingStatus == StateStatus.success) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowLevelView(
                  titleText: professionText,
                  value: state.selectedProfession.name,
                  list: state.professions
                      .map((profession) => profession.name)
                      .toList(),
                  onChanged: (professionName) =>
                      _onProfessionChange(professionName, context),
                ),
                const SizedBox(height: twenty),
                RowLevelView(
                  titleText: bandText,
                  value: state.selectedBand.name,
                  list: state.bands.map((band) => band.name).toList(),
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

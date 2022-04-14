import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/numbers.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/enums/enums.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_cubit.dart';
import 'package:stepper/presentation/profile_user_edit/cubit/user_profile_edit_state.dart';
import 'package:stepper/presentation/profile_user/views/row_level_view.dart';

class UserLevelView extends StatelessWidget {
  final EdgeInsets margin;

  const UserLevelView({
    Key? key,
    this.margin = const EdgeInsets.only(
      left: twenty,
      right: twenty,
    ),
  }) : super(key: key);

  _onProfessionChange(String professonName, BuildContext context) async {
    await context
        .read<UserProfileEditCubit>()
        .onProfessionChanged(professionName: professonName);
    context
        .read<UserProfileEditCubit>().onSaveProfessionAndBand();
  }

  _onBandChange(String bandName, BuildContext context) async {
    await context.read<UserProfileEditCubit>().onBandChanged(bandName: bandName);
    context
        .read<UserProfileEditCubit>().onSaveProfessionAndBand();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: margin,
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

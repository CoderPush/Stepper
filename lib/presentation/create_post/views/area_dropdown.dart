import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state.dart';

class AreaDropdown extends StatelessWidget {
  const AreaDropdown({Key? key}) : super(key: key);

  void _onDropdownItemSelected(BuildContext context, String areaName) {
    context.read<CreatePostCubit>().onAreaChanged(areaName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      decoration: BoxDecoration(
        color: dropdownButtonColor,
        borderRadius: BorderRadius.circular(extraLargeBorderRadius),
      ),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          final List<String> areas =
              state.areas.map((area) => area.name).toList();
          return CustomDropdown(
              disabled: state.mode == CreatePostScreenMode.edit,
              disableHintText: state.selectedArea.name,
              onChanged: (value) {
                _onDropdownItemSelected(context, value);
              },
              value: state.selectedArea.name,
              items: areas);
        },
      ),
    );
  }
}

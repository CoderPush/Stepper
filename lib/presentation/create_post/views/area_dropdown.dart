import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/common/commons.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';

class AreaDropdown extends StatelessWidget {
  const AreaDropdown({Key? key}) : super(key: key);

  void _onDropdownItemSelected(BuildContext context, String areaName) {
    context.read<CreatePostCubit>().onChangeAreaName(areaName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      decoration: BoxDecoration(
        color: dropdownButtonColor,
        borderRadius: BorderRadius.circular(extraLargeBorderRadius),
      ),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          final currentState = state as CreatePostLoadedState;
          return DropdownButtonHideUnderline(
            child: ButtonTheme(
              buttonColor: white,
              alignedDropdown: true,
              child: CustomDropdownButton<String>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: white,
                ),
                dropdownColor: dropdownButtonColor,
                iconEnabledColor: white,
                onChanged: (value) {
                  _onDropdownItemSelected(context, value);
                },
                value: currentState.selectedAreaName,
                items: currentState.areaList
                    .map(
                      (area) => DropdownMenuItem(
                        child: Text(area.areaName),
                        value: area.areaName,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

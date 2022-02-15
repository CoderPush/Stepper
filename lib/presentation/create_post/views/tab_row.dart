import 'package:flutter/material.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit_2.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_state_2.dart';

class TabRow extends StatelessWidget {
  const TabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<CreatePostCubit2, CreatePostState2>(
        builder: (context, state) => TabBar(
          physics: const NeverScrollableScrollPhysics(),
          labelPadding: const EdgeInsets.all(0.0),
          onTap: (index) {
            if (state.mode == CreatePostScreenMode.edit) return;

            switch (index) {
              case 0:
                context
                    .read<CreatePostCubit2>()
                    .onAreaTypeChanged(AreaType.scope);
                break;
              case 1:
                context
                    .read<CreatePostCubit2>()
                    .onAreaTypeChanged(AreaType.expertise);
                break;
              case 2:
                context
                    .read<CreatePostCubit2>()
                    .onAreaTypeChanged(AreaType.mindset);
                break;
            }
          },
          indicatorColor: Colors.transparent,
          tabs: [
            TabBarItem(
              tabBarText: scope,
              isSelected: state.selectedAreaType == AreaType.scope,
            ),
            TabBarItem(
              tabBarText: expertise,
              isSelected: state.selectedAreaType == AreaType.expertise,
            ),
            TabBarItem(
              tabBarText: mindset,
              isSelected: state.selectedAreaType == AreaType.mindset,
            )
          ],
        ),
      ),
    );
  }
}

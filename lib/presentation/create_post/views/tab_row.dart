import 'package:flutter/material.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabRow extends StatelessWidget {
  const TabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        onTap: (index) {
          switch (index) {
            case 0:
              context
                  .read<CreatePostCubit>()
                  .onAreaTypeTabChanged(AreaType.scope);
              break;
            case 1:
              context
                  .read<CreatePostCubit>()
                  .onAreaTypeTabChanged(AreaType.expertise);
              break;
            case 2:
              context
                  .read<CreatePostCubit>()
                  .onAreaTypeTabChanged(AreaType.mindset);
              break;
          }
        },
        indicatorColor: Colors.transparent,
        tabs: [
          BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
              return TabBarItem(
                tabBarText: scope,
                isSelected: state.selectedAreaType == AreaType.scope,
              );
            },
          ),
          BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
              return TabBarItem(
                tabBarText: expertise,
                isSelected: state.selectedAreaType == AreaType.expertise,
              );
            },
          ),
          BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
              return TabBarItem(
                tabBarText: mindset,
                isSelected: state.selectedAreaType == AreaType.mindset,
              );
            },
          ),
        ],
      ),
    );
  }
}

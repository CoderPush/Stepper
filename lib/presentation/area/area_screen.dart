import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/repositories/fake_repos/fake_area_repository_impl.dart';
import 'package:stepper/presentation/area/cubit/area_cubit.dart';
import 'package:stepper/presentation/area/views/expertise_view.dart';
import 'package:stepper/presentation/area/views/mindset_view.dart';
import 'package:stepper/presentation/area/views/scope_view.dart';
import 'package:stepper/presentation/area/views/tabbar_item.dart';
import 'package:stepper/presentation/common/drawer/drawer.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AreaCubit(areaRepository: FakeAreaRepositoryImpl()),
      child: Builder(builder: (context) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkPurple,
              title: const Text(area),
              centerTitle: true,
              bottom: TabBar(
                onTap: (index) {
                  switch (index) {
                    case 0:
                      context.read<AreaCubit>().getAreas(AreaType.scope);
                      break;
                    case 1:
                      context.read<AreaCubit>().getAreas(AreaType.expertise);
                      break;
                    case 2:
                      context.read<AreaCubit>().getAreas(AreaType.mindset);
                      break;
                  }
                },
                indicatorColor: Colors.transparent,
                tabs: [
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      return TabBarItem(
                        tabBarText: scope,
                        isSelected: state.areaType == AreaType.scope,
                      );
                    },
                  ),
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      return TabBarItem(
                        tabBarText: expertise,
                        isSelected: state.areaType == AreaType.expertise,
                      );
                    },
                  ),
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      return TabBarItem(
                        tabBarText: mindset,
                        isSelected: state.areaType == AreaType.mindset,
                      );
                    },
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: TabBarView(
                children: [
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      if (state is AreaLoading) {
                        return _buildLoadingState();
                      } else if (state is AreaLoaded) {
                        return ScopeView(areaList: state.areaList);
                      } else if (state is AreaError) {
                        return const Text('Error loading scope area');
                      }
                      return _buildLoadingState();
                    },
                  ),
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      if (state is AreaLoading) {
                        return _buildLoadingState();
                      } else if (state is AreaLoaded) {
                        return ExpertiseView(areaList: state.areaList);
                      } else {
                        return const Text('Error loading scope area');
                      }
                    },
                  ),
                  BlocBuilder<AreaCubit, AreaState>(
                    builder: (context, state) {
                      if (state is AreaLoading) {
                        return _buildLoadingState();
                      } else if (state is AreaLoaded) {
                        return MindsetView(areaList: state.areaList);
                      } else {
                        return const Text('Error loading scope area');
                      }
                    },
                  ),
                ],
              ),
            ),
            drawer: MainDrawer(),
          ),
        );
      }),
    );
  }
}

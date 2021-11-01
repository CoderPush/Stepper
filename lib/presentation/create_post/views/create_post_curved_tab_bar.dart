import 'package:flutter/material.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/data/model/post.dart';
import 'package:stepper/presentation/create_post/cubit/create_post_cubit.dart';

class CreatePostCurvedTabBar extends StatefulWidget {
  const CreatePostCurvedTabBar({Key? key}) : super(key: key);

  @override
  State<CreatePostCurvedTabBar> createState() => _CreatePostCurvedTabBarState();
}

class _CreatePostCurvedTabBarState extends State<CreatePostCurvedTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = _tabController.index;
          context.read<CreatePostCubit>().onCreatePostModeChange(
              _selectedTabIndex == 0
                  ? CreatePostMode.writeUpdate
                  : CreatePostMode.setGoal);
        });
      }
    });
  }

  bool _isLeftTabSelected() {
    return _selectedTabIndex == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkPurple,
      child: TabBar(
        indicator: ShapeDecoration(
          color: blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: _isLeftTabSelected()
                ? const BorderRadius.only(
                    topRight: Radius.circular(largeBorderRadius),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(largeBorderRadius),
                  ),
          ),
        ),
        indicatorColor: Colors.transparent,
        controller: _tabController,
        tabs: const [
          Tab(child: Text(writeUpdate)),
          Tab(child: Text(setGoal)),
        ],
      ),
    );
  }
}

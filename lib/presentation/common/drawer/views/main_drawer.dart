import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:stepper/presentation/common/drawer/cubit/drawer_cubit.dart';
import 'package:stepper/presentation/common/drawer/views/drawer_item.dart';
import 'package:stepper/config/routes/routes.dart';

class DrawerData {
  final String drawerTitle;
  final IconData drawerIcon;
  final DrawerType drawerType;

  DrawerData({
    required this.drawerTitle,
    required this.drawerIcon,
    required this.drawerType,
  });
}

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  final List<DrawerData> _drawerList = [
    DrawerData(
      drawerTitle: home,
      drawerIcon: Icons.home,
      drawerType: DrawerType.home,
    ),
    DrawerData(
      drawerTitle: area,
      drawerIcon: Icons.article_outlined,
      drawerType: DrawerType.area,
    ),
    DrawerData(
      drawerTitle: calendar,
      drawerIcon: Icons.calendar_today,
      drawerType: DrawerType.calendar,
    ),
  ];

  void _onDrawerClosed(BuildContext context) {
    Navigator.of(context).pop();
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return _drawerList
        .map((drawer) => DrawerItem(
              drawerTitle: drawer.drawerTitle,
              drawerIcon: drawer.drawerIcon,
              drawerType: drawer.drawerType,
            ))
        .toList();
  }

  void _onProfileUserScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.profileUser,
    );
  }

  void _onHomeScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.home,
    );
  }

  void _onAreaScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.area,
    );
  }

  void _onCalendarScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      RouteNames.calendar,
    );
  }

  void _onAboutButtonTap(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.about);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {
        if (state.selectedItem == DrawerType.home) {
          _onHomeScreenTap(context);
        } else if (state.selectedItem == DrawerType.area) {
          _onAreaScreenTap(context);
        } else if (state.selectedItem == DrawerType.calendar) {
          _onCalendarScreenTap(context);
        } else {
          _onProfileUserScreenTap(context);
        }
      },
      builder: (context, state) => SafeArea(
        child: Drawer(
          child: Container(
            color: darkBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: screenMediumPadding,
                        left: screenSmallPadding,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: darkGrey,
                          child: Image.asset('assets/images/avatar.png'),
                        ),
                        title: BlocBuilder<AuthenticationCubit,
                            AuthenticationState>(
                          builder: (context, state) {
                            return Text((state as AuthenticatedState).userName);
                          },
                        ),
                        trailing: IconButton(
                          tooltip: closeDrawerButton,
                          onPressed: () => _onDrawerClosed(context),
                          icon: const Icon(Icons.arrow_back_ios, color: orange),
                        ),
                        onTap: () => context
                            .read<DrawerCubit>()
                            .selectDrawerItem(DrawerType.profile),
                      ),
                    ),
                    ..._buildDrawerItems(context),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: screenMediumPadding),
                  child: TextButton(
                    child: const Text(
                      aboutStepper,
                      style: TextStyle(color: white),
                    ),
                    onPressed: () => _onAboutButtonTap(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

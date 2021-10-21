import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/presentation/common/drawer/cubit/drawer_cubit.dart';

class DrawerItem extends StatelessWidget {
  final String drawerTitle;
  final IconData drawerIcon;
  final DrawerType drawerType;

  const DrawerItem({
    Key? key,
    required this.drawerTitle,
    required this.drawerIcon,
    required this.drawerType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerCubit = BlocProvider.of<DrawerCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: screenSmallPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(mediumBorderRadius),
        ),
        elevation: 0.0,
        color: drawerType == drawerCubit.state.selectedItem
            ? lightGrey
            : mediumGrey,
        child: ListTile(
          leading: Icon(
            drawerIcon,
            color: black,
          ),
          title: Text(drawerTitle),
          onTap: () => drawerCubit.selectDrawerItem(drawerType),
        ),
      ),
    );
  }
}

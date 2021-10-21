import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _onItemTap(BuildContext context) {
    BlocProvider.of<DrawerCubit>(context).selectDrawerItem(drawerType);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        drawerIcon,
        color: black,
      ),
      title: Text(drawerTitle),
      onTap: () =>  _onItemTap(context),
    );
  }
}

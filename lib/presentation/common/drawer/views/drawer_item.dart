import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class DrawerItem extends StatelessWidget {
  final String drawerTitle;
  final IconData drawerIcon;
  final void Function() onTap;

  const DrawerItem({
    Key? key,
    required this.drawerTitle,
    required this.drawerIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        drawerIcon,
        color: black,
      ),
      title: Text(drawerTitle),
    );
  }
}

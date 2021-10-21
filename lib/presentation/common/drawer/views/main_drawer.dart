import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/common/texts.dart';
import 'package:stepper/dummy_data.dart';
import 'package:stepper/presentation/common/drawer/views/drawer_item.dart';
import 'package:stepper/routes.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  final Map<String, IconData> _drawerItems = {
    home: Icons.home,
    area: Icons.article_outlined,
    calendar: Icons.calendar_today,
  };

  void _onDrawerClosed(BuildContext context) {
    Navigator.of(context).pop();
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return _drawerItems.entries.map((entry) {
      void Function() onTap;
      if (entry.key == home) {
        onTap = () => _onHomeScreenTap(context);
      } else if (entry.key == area) {
        onTap = () => _onAreaScreenTap(context);
      } else {
        onTap = () => _onCalendarScreenTap(context);
      }
      return DrawerItem(
        onTap: onTap,
        drawerTitle: entry.key,
        drawerIcon: entry.value,
      );
    }).toList();
  }

  void _onHomeScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.home,
    );
  }

  void _onAreaScreenTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      Routes.area,
    );
  }

  void _onCalendarScreenTap(BuildContext context) {
    //TODO implement calendar tap here
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: mediumGrey,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    avatarProfileUrl,
                  ),
                ),
                title: const Text('John Doe'),
                trailing: IconButton(
                  onPressed: () => _onDrawerClosed(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              ..._buildDrawerItems(context),
            ],
          ),
        ),
      ),
    );
  }
}

part of 'drawer_cubit.dart';

enum DrawerType {
  profile,
  home,
  area,
  calendar,
}

@immutable
class DrawerState {
  final DrawerType selectedItem;

  const DrawerState(this.selectedItem);
}

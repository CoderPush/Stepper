import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerState(DrawerType.home));

  void selectDrawerItem(DrawerType drawerType) {
    emit(DrawerState(drawerType));
  }
}

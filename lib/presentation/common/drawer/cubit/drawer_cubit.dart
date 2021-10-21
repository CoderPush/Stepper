import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerState(DrawerType.home));

  void selectDrawerItem(DrawerType navItem) {
    emit(DrawerState(navItem));
  }
}

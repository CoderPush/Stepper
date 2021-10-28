import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stepper/common/consts.dart';
import 'package:stepper/data/model/area.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(const CreatePostInitial());

  void onChangeTab(AreaType areaType) {
    emit(CreatePostChangeAreaType(
      selectedAreaType: areaType,
      areaName: state.areaName,
      areaRating: state.areaRating,
    ));
  }

  void onChangeAreaName(String areaName) {
    emit(CreatePostChangeAreaName(
        areaName: areaName,
        areaRating: state.areaRating,
        selectedAreaType: state.selectedAreaType));
  }

  void onChangeAreaRating(int areaRating) {
    emit(CreatePostChangeAreaRating(
      areaRating: areaRating,
      areaName: state.areaName,
      selectedAreaType: state.selectedAreaType,
    ));
  }
}

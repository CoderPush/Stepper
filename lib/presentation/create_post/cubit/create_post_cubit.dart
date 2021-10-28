import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stepper/data/model/area.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit()
      : super(const CreatePostInitial(selectedAreaType: AreaType.scope));
}

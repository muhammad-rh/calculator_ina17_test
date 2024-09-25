import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit() : super(InputInitial());

  Future<void> onPickImageCamera() async {
    emit(InputInitial());
    XFile? pickedPhoto = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedPhoto != null) {
      emit(InputSuccess(pickedPhoto));
    }
  }

  Future<void> onPickImageGallery() async {
    emit(InputInitial());
    XFile? pickedPhoto = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedPhoto != null) {
      emit(InputSuccess(pickedPhoto));
    }
  }
}

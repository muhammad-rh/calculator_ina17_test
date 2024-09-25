part of 'input_cubit.dart';

sealed class InputState extends Equatable {
  const InputState();

  @override
  List<Object> get props => [];
}

final class InputInitial extends InputState {}

final class InputSuccess extends InputState {
  final XFile pickedPhoto;

  const InputSuccess(this.pickedPhoto);

  @override
  List<Object> get props => [pickedPhoto];
}

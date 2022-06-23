import 'package:flutter_bloc/flutter_bloc.dart';

class TopBarToggleCubit extends Cubit<bool> {
  TopBarToggleCubit() : super(true);

  void toggleTopBar(bool value) {
    emit(value);
  }
}

class ToggleViewCubit extends Cubit<bool> {
  ToggleViewCubit() : super(true);

  void toggleView(bool value) {
    emit(value);
  }
}

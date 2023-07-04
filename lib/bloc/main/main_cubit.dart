import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_state.dart';

class MainCubit<State extends MainCubitState> extends Cubit<State> {
  MainCubit(State initialState) : super(initialState);
}

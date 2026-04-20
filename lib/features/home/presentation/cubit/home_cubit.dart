import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(page: 0, notes: []));

  void changePage(int index) {
    emit(HomeState(page: index, notes: state.notes));
  }

  void addNote(String note) {
    emit(HomeState(page: state.page, notes: state.notes..add(note)));
  }
}

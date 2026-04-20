import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh1/features/home/presentation/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0, text: 'Hello', sonlar: []));

  void increment() {
    emit(
      CounterState(
        count: state.count + 1,
        text: state.text,
        sonlar: state.sonlar,
      ),
    );
  }

  void changeText(String text) {
    emit(CounterState(count: state.count, text: text, sonlar: state.sonlar));
  }

  void addNumber(int number) {
    emit(
      CounterState(
        count: state.count,
        text: state.text,
        sonlar: state.sonlar..add(number),
      ),
    );
  }
}

part of 'countercubit_cubit.dart';

// @immutable
// abstract class CountercubitState {}

// class CountercubitInitial extends CountercubitState {}
class CounterState {
  int counterValue;
  bool? wasInceremented;
  CounterState({
    required this.counterValue,
    this.wasInceremented,
  });
}

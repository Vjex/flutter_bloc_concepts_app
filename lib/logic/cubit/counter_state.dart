part of 'counter_cubit.dart';

// @immutable
// abstract class CountercubitState {}

// class CountercubitInitial extends CountercubitState {}
//Egquatable is used for Matching/Testing time scenario so that comparision based on Memory Location Not applied when comparing two objects of this class based on memry just on value .
// class CounterState extends Equatable {
//   final int counterValue;
//   final bool? wasInceremented;
//   CounterState({
//     required this.counterValue,
//     this.wasInceremented,
//   });

//   @override
//   List<Object> get props => [this.counterValue, this.wasInceremented];
// }
class CounterState {
  int counterValue;
  bool? wasInceremented;
  CounterState({
    required this.counterValue,
    this.wasInceremented,
  });

  // @override
  // List<Object> get props => [this.counterValue, this.wasInceremented];
}

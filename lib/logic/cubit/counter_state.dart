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
// class CounterState {
//   int counterValue;
//   bool? wasInceremented;
//   CounterState({
//     required this.counterValue,
//     this.wasInceremented,
//   });

//   // @override
//   // List<Object> get props => [this.counterValue, this.wasInceremented];
// }

//For Using Hydarted Bloc for Storing the Counter Cubit state for later use on app restart by using json.

//Also som efunction override like toString() to show the there use at debugging time of the app.

class CounterState {
  int counterValue;
  bool? wasInceremented;

  CounterState({
    required this.counterValue,
    this.wasInceremented,
  });

  // @override
  // List<Object> get props => [this.counterValue, this.wasInceremented];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasInceremented': wasInceremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
      wasInceremented: map['wasInceremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  //this is the class available method throg which we can convert our class paramater to string for pronting at debugging time.
  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, wasInceremented: $wasInceremented)';
}

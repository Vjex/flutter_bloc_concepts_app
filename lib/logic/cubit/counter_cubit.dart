// import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:bloc_concepts_app/constants/enums.dart';
// import 'package:bloc_concepts_app/logic/cubit/internet_cubit.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

part 'counter_state.dart';

//With Using Stream
// class CounterCubit extends Cubit<CounterState> {
//   final InternetCubit internetCubit;
//   StreamSubscription? internetSubscription;

//   CounterCubit({required this.internetCubit})
//       : super(CounterState(counterValue: 0)) {
//     monitorInternetConnection();
//   }

//   StreamSubscription<InternetState> monitorInternetConnection() {
//     return internetSubscription = internetCubit.stream.listen((internetState) {
//       if (internetState is InternetConnected &&
//           internetState.connectionType == ConnectionType.Wifi) {
//         increment();
//       } else if (internetState is InternetConnected &&
//           internetState.connectionType == ConnectionType.Mobile) {
//         decrement();
//       }
//     });
//   }

//   void increment() => emit(
//         CounterState(
//           counterValue: state.counterValue + 1,
//           wasInceremented: true,
//         ),
//       );
//   void decrement() => emit(
//         CounterState(
//           counterValue: state.counterValue - 1,
//           wasInceremented: false,
//         ),
//       );

//   @override
//   Future<void> close() {
//     internetSubscription?.cancel();
//     return super.close();
//   }
// }

// //With Using BlockListner
// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(CounterState(counterValue: 0));

//   void increment() => emit(
//         CounterState(
//           counterValue: state.counterValue + 1,
//           wasInceremented: true,
//         ),
//       );
//   void decrement() => emit(
//         CounterState(
//           counterValue: state.counterValue - 1,
//           wasInceremented: false,
//         ),
//       );
// }

//Elaaborating the Use of Hydarted bloc library to save the state of the Counter Cubit for later usage when app restart .
//This can be done using the hydartedMixin provided by hydratedbloc library.
//Also below is the representation of some bloc debugging methoths like , onChnage(), onError()  etc.
class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          wasInceremented: true,
        ),
      );
  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          wasInceremented: false,
        ),
      );

  //Method to retrieve the hydrated saved state from json
  //Note these fromJson method is automatically called by Hydrated Mixin when wanted no need to manage the calling.

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  //Method needt to ovveride to save the hydrated  state in json on every state change of counter cubit.
  //Note these to Json method is automatically called by Hydrated Mixin when wanted no need to manage the calling.
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    //Adding a Error Example for checking that onError catcjhes the Error or not and how .

    //Commented Afetr testing.
    //addError(Exception("Just Testing the on Error |"), StackTrace.current);

    //Converting current state to Json to save automativcally.
    return state.toMap();
  }

  //Note We Do not need to Manually add these Method Overriding to each cubit fpr error handling and debugging if we are Using Inbuily
  //Error Debugging technique for all the cubits
  //i.e : BlocObserver
  //We are using BlocIbeserver in this app.
  //this is done under Utility folder under logig bolder  through the Clas AppblocObserver.

  // //onChnage MEthod are called whenever a new State emitted by this cubit or Bloc.
  // @override
  // void onChange(Change<CounterState> change) {
  //   print(change);

  //   super.onChange(change);
  // }

  // //Overriding this inbuild method to get the any exception occured in the cubit .
  // //this gives the error object along with the whole stacktrace of the app.
  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('$error , $stackTrace');
  //   super.onError(error, stackTrace);
  // }
}

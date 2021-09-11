import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concepts_app/constants/enums.dart';
import 'package:bloc_concepts_app/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetConnection();
  }

  StreamSubscription<InternetState> monitorInternetConnection() {
    return internetSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

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

  @override
  Future<void> close() {
    internetSubscription?.cancel();
    return super.close();
  }
}

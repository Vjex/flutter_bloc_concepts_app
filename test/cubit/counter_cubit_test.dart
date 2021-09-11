// import 'package:bloc_concepts_app/logic/cubit/counter_cubit.dart';
// import 'package:bloc_concepts_app/logic/cubit/internet_cubit.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:test/test.dart';

// void main() {
//   group('CounterCubit', () {
//     CounterCubit? counterCubit;

//     setUp(() {
//       counterCubit = CounterCubit(
//           internetCubit: InternetCubit(connectivity: Connectivity()));
//     });

//     tearDown(() {
//       counterCubit!.close();
//     });

//     test('initial state of CounterCubit is CounterState(counterValue:0)', () {
//       expect(counterCubit!.state, CounterState(counterValue: 0));
//     });

//     // blocTest(
//     //     'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
//     //     build: () => counterCubit,
//     //     act: (cubit) => cubit!.add(CounterEvent.increment),
//     //     expect: [CounterState(counterValue: 1, wasIncremented: true)]);

//     // blocTest(
//     //     'the CounterCubit should emit a CounterState(counterValue:-1, wasIncremented:false) when the decrement function is called',
//     //     build: () => counterCubit,
//     //     act: (cubit) => cubit.decrement(),
//     //     expect: [CounterState(counterValue: -1, wasIncremented: false)]);
//   });
// }

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}

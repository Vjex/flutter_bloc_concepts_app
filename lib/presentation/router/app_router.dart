import 'package:bloc_concepts_app/logic/cubit/counter_cubit.dart';
import 'package:bloc_concepts_app/presentation/screens/home_screen.dart';
import 'package:bloc_concepts_app/presentation/screens/second_screen.dart';
import 'package:bloc_concepts_app/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenertaRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              HomeScreen(title: 'Home Screen', color: Colors.blueAccent),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(title: 'Second Screen', color: Colors.redAccent),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(title: 'Third Screen', color: Colors.greenAccent),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(title: 'Home Screen', color: Colors.blue),
        );
    }
  }

  // void dispose() {
  //   _counterCubit.close();
  // }
}

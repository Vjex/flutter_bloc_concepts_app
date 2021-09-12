import 'package:bloc_concepts_app/logic/cubit/counter_cubit.dart';
import 'package:bloc_concepts_app/logic/cubit/internet_cubit.dart';
import 'package:bloc_concepts_app/logic/utility/app_bloc_observer.dart';
import 'package:bloc_concepts_app/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  //Ensuring that all widget are binded before caalling the native code we Use below Line
  WidgetsFlutterBinding.ensureInitialized();

  //Now We Are using the hydrated bloc library to store the state of the app at the apllication default directory by getting the application
  //directory location through path_proovider library so that that state can be reused when app restarted again even after some time or some days.
  //note hydrated_bloc library stores data of state in json format.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  //Saving the AppBloc Observer so that Each Bloc or Cubit can be mainatiner by our observer Class under utility folder which
  //is under logic folder.
  Bloc.observer = AppBlocObserver();

  runApp(MyApp(
    appRoute: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRoute;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.appRoute, required this.connectivity})
      : super(key: key);

  // = AppRouter();

  // @override
  // void dispose() {
  //   //Closse The All Cubits/bloc
  //   // _appRoute.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRoute.onGenertaRoute,
      ),
    );
  }
}

import 'package:bloc_concepts_app/constants/enums.dart';
import 'package:bloc_concepts_app/logic/cubit/internet_cubit.dart';
import 'package:bloc_concepts_app/presentation/screens/second_screen.dart';

import '/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;

  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // backgroundColor: widget.color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wi-fi',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.green,
                        ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: Colors.red,
                        ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),

            Text(
              'You have pushed the button this many times:',
            ),
            //Bloc Builder for Rebuilting this child text widgeton depending upon current state value
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasInceremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Incremented',
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                } else if (state.wasInceremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'Negative :' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'Even No :' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'no is 5 :' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    'No : :' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'h1',
                  onPressed: () {
                    //Now Calling Decrement Function Written in Cut
                    //But First We need to Access Or Cubit .
                    //For This We have two Ways below one is Commented//
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'h2',
                  onPressed: () {
                    //Now Calling Decrement Function Written in Cut
                    //But First We need to Access Or Cubit .
                    //For This We have two Ways below one is Commented//
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                //
                Navigator.of(context).pushNamed('/second');
              },
              child: Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                //
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

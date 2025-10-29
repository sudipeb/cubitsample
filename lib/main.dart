import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

//initializing a list of names
const name = [
  'Ram',
  'Shyam',
  'Hari',
  'Gita',
  'Sita',
  'John',
  'Doe',
  'Jane',
  'Smith',
  'Emily',
];

extension RandomElement<T> on Iterable<T> {
  //getting random index number from the list
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

//declaring the cubit class with the initial state as null and and state type as optional String
class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);
  //function to pick random name from the list and emit the new state
  void pickRandomName() => emit(name.getRandomElement());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final NamesCubit nameCubit;
  @override
  void initState() {
    super.initState();
    nameCubit = NamesCubit(); //initializing the cubit for any statechanges
  }

  @override
  void dispose() {
    nameCubit
        .close(); //closing the cubit to prevent memory leaks while state is not in use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'cubit Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Cubit Demo App')),
        body: Center(
          //using StreamBuilder to listen to the stream of the cubit for any state changes
          child: StreamBuilder<String?>(
            //listening to the stream of the cubit we initialized
            stream: nameCubit.stream,
            //builder to build the UI based on the snapshot of the stream initially null
            builder: (context, snapshot) {
              final button = TextButton(
                onPressed: () => nameCubit.pickRandomName(),
                child: const Text("Pick random name"),
              );
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return button;
                case ConnectionState.waiting:
                  return button;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          snapshot.data ?? 'No Names Picked',
                        ), //displaying the picked random name from the snapshot data
                        button,
                      ],
                    ),
                  );
                case ConnectionState.done:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

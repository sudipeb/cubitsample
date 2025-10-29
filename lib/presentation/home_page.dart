import 'package:cubitsample/application/name_cubit.dart';
import 'package:cubitsample/domain/entities/name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.nameCubit});
  final NameCubit nameCubit;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic CubitDemo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder<Name?>(
              stream: nameCubit.stream,
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
                            snapshot.data?.name ?? 'No Names Picked',
                          ), //displaying the picked random name from the snapshot data
                          button,
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    return button;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

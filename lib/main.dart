import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'cubit Demo',
      home: Scaffold(appBar: AppBar(title: Text('Cubit Demo App'))),
    );
  }
}

import 'package:cubitsample/application/name_cubit.dart';
import 'package:cubitsample/data/repositories/name_repositories_impl.dart';
import 'package:cubitsample/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = NameRepositoryImpl();
    final cubit = NameCubit(repository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubit Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(nameCubit: cubit), 
    );
  }
}

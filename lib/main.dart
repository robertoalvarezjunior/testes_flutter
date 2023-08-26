import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testes/bloc/counter/bloc_observer.dart';
import 'package:testes/get_it_bindings.dart';
import 'package:testes/router.dart';

void main() {
  Bloc.observer = const CounterObserver();
  getItSetup();
  runApp(const CounterApp());
}

// class CounterApp extends MaterialApp {
//   const CounterApp({super.key}) : super(home: const CounterView());
// }

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterNav().router,
      theme: ThemeData(useMaterial3: true),
    );
  }
}

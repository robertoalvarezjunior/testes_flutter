import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes/get_it_bindings.dart';
import 'package:testes/mobx/counter/counter_store.dart';

class MobxCounter extends StatelessWidget {
  const MobxCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobx Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (context) => Text(
                '${getIt<Counter>().counter}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: getIt<Counter>().decrement,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: getIt<Counter>().increment,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(''),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.push('/counter'),
              child: const Text('Counter'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/timer'),
              child: const Text('Timer'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/mobxCounter'),
              child: const Text('Mobx Counter'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/mobxDiceCounter'),
              child: const Text('Mobx DiceCounter'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/mobxTodo'),
              child: const Text('Todo'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/conect'),
              child: const Text('Conectivity'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/github'),
              child: const Text('GitHub'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/news'),
              child: const Text('News'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/random'),
              child: const Text('Random Number'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/pen'),
              child: const Text('Pen'),
            ),
          ],
        ),
      ),
    );
  }
}

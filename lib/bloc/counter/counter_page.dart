import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testes/bloc/counter/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) =>
                Text('Cubit: $state', style: textTheme.displayMedium),
          ),
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) => Center(
                child: Text('Bloc: $count', style: textTheme.displayMedium)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementPressed()),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              FilledButton.tonal(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementPressed()),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

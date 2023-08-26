import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testes/bloc/counter/counter_controller.dart';
import 'package:testes/bloc/counter/counter_page.dart';
import 'package:testes/bloc/timer/timer_page.dart';
import 'package:testes/get_it_bindings.dart';
import 'package:testes/home.dart';
import 'package:testes/mobx/connectivity/connectivity_store.dart';
import 'package:testes/mobx/connectivity/connectivity_view.dart';
import 'package:testes/mobx/counter/mobx_counter.dart';
import 'package:testes/mobx/dice/dice_view.dart';
import 'package:testes/mobx/github%20repos/github_view.dart';
import 'package:testes/mobx/hacker%20news/news_view.dart';
import 'package:testes/mobx/random%20stream/random_view.dart';
import 'package:testes/mobx/todo/todo_view.dart';

class RouterNav {
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: '/counter',
        builder: (context, state) => BlocProvider(
          create: (context) => CounterBloc(),
          child: const CounterPage(),
        ),
      ),
      GoRoute(
        path: '/timer',
        builder: (context, state) => const TimerPage(),
      ),
      GoRoute(
        path: '/mobxCounter',
        builder: (context, state) => MobxCounter(),
      ),
      GoRoute(
        path: '/mobxDiceCounter',
        builder: (context, state) => const DiceView(),
      ),
      GoRoute(
        path: '/mobxTodo',
        builder: (context, state) => const TodoView(),
      ),
      GoRoute(
        path: '/conect',
        builder: (context, state) => ConnectivityExample(
          getIt.get<ConnectivityStore>(),
        ),
      ),
      GoRoute(
        path: '/github',
        builder: (context, state) => const GithubExample(),
      ),
      GoRoute(
        path: '/news',
        builder: (context, state) => const HackerNewsExample(),
      ),
      GoRoute(
        path: '/random',
        builder: (context, state) => const RandomNumberExample(),
      ),
    ],
  );

  get router => _router;
}

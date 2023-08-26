import 'package:get_it/get_it.dart';
import 'package:testes/mobx/connectivity/connectivity_store.dart';
import 'package:testes/mobx/counter/counter_store.dart';
import 'package:testes/mobx/dice/dice_counter.dart';

final getIt = GetIt.instance;

getItSetup() {
  getIt.registerSingleton<ConnectivityStore>(ConnectivityStore());
  getIt.registerSingleton<Counter>(Counter());
  getIt.registerSingleton<DiceCounter>(DiceCounter());
}

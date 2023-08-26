import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() => counter++;

  @action
  void decrement() => counter--;
}

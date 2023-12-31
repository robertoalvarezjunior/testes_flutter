import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class Todo = TodoBase with _$Todo;

abstract class TodoBase with Store {
  TodoBase(this.description);

  @observable
  String description = '';

  @observable
  bool done = false;
}

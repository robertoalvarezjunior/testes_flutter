import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:testes/mobx/todo/todo_list.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) => Provider<TodoList>(
        create: (context) => TodoList(),
        // builder: (_) => TodoList(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          body: Column(
            children: <Widget>[
              AddTodo(),
              const ActionBar(),
              const Description(),
              const TodoListView()
            ],
          ),
        ),
      );
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoList>();

    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          list.itemsDescription,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoList>();

    return Observer(
      builder: (_) => Flexible(
        child: ListView.builder(
          itemCount: list.visibleTodos.length,
          itemBuilder: (_, index) {
            final todo = list.visibleTodos[index];
            return Observer(
              builder: (_) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: todo.done,
                onChanged: (flag) => todo.done = flag!,
                title: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      todo.description,
                      overflow: TextOverflow.ellipsis,
                    )),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => list.removeTodo(todo),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoList>();

    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
          labelText: 'Add a Todo', contentPadding: EdgeInsets.all(8)),
      controller: _textController,
      textInputAction: TextInputAction.done,
      onSubmitted: (String value) {
        list.addTodo(value);
        _textController.clear();
      },
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoList>();

    return Column(children: <Widget>[
      Observer(
        builder: (_) => Column(
          children: <Widget>[
            RadioListTile(
                dense: true,
                title: const Text('All'),
                value: VisibilityFilter.all,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
            RadioListTile(
                dense: true,
                title: const Text('Pending'),
                value: VisibilityFilter.pending,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
            RadioListTile(
                dense: true,
                title: const Text('Completed'),
                value: VisibilityFilter.completed,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!),
          ],
        ),
      ),
      Observer(
          builder: (_) => ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: list.canRemoveAllCompleted
                        ? list.removeCompleted
                        : null,
                    child: const Text('Remove Completed'),
                  ),
                  ElevatedButton(
                    onPressed: list.canMarkAllCompleted
                        ? list.markAllAsCompleted
                        : null,
                    child: const Text('Mark All Completed'),
                  )
                ],
              ))
    ]);
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

class DidUpdateWidget extends StatefulWidget {
  const DidUpdateWidget({super.key});

  @override
  State<DidUpdateWidget> createState() => _DidUpdateWidgetState();
}

class _DidUpdateWidgetState extends State<DidUpdateWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
        body: ChildWidget(counter: _counter),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    super.initState();
    log("initState method");
  }

  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    log("didUpdateWidget Method");

    if (oldWidget.counter != widget.counter) {
      log("The old widget with counter: ${oldWidget.counter} was replaced with new widget with counter: ${widget.counter}");
    }

    if (oldWidget.counter != widget.counter) {
      setState(() {
        val = widget.counter + 1;
      });
    }
  }

  @override
  void dispose() {
    log("dispose Method");
    super.dispose();
  }

  int val = 0;

  @override
  Widget build(BuildContext context) {
    log("build Method");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${widget.counter}"),
            Text("$val"),
          ],
        ),
      ),
    );
  }
}

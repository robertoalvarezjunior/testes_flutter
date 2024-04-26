import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomePen extends StatefulWidget {
  const HomePen({super.key});

  @override
  State<HomePen> createState() => _HomePenState();
}

class _HomePenState extends State<HomePen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Listener(
          onPointerDown: (event) {
            PointerDeviceKind kind = event.kind;

            log('--- $kind ---');
          },
          child: Container(
            height: 500,
            width: 500,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

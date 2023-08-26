import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes/get_it_bindings.dart';
import 'package:testes/mobx/dice/dice_counter.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffab403),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (context) => Image.asset(
                          'assets/diceImages/dice${getIt<DiceCounter>().left}.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (context) => Image.asset(
                          'assets/diceImages/dice${getIt<DiceCounter>().right}.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Observer(
                builder: (context) => Text(
                  'Total ${getIt<DiceCounter>().total}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 16),
                ),
              ),
            ),
            Center(
              child: FilledButton.tonal(
                onPressed: getIt<DiceCounter>().roll,
                child: const Text(
                  'ROLL',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modals extends StatefulWidget {
  const Modals({super.key});

  @override
  State<Modals> createState() => _ModalsState();
}

class _ModalsState extends State<Modals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                showAboutDialog(context: context);
              },
              child: const Text('showAboutDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(child: Text('showAdaptiveDialog'));
                  },
                );
              },
              child: const Text('showAdaptiveDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
              },
              child: const Text('showDatePicker'),
            ),
            ElevatedButton(
              onPressed: () {
                showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
              },
              child: const Text('showDateRangePicker'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(child: Text('showDialog'));
                  },
                );
              },
              child: const Text('showDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              child: const Text('showLicensePage'),
            ),
            ElevatedButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(20, 20, 20, 20),
                    items: [const PopupMenuItem(child: Text('showMenu'))]);
              },
              child: const Text('showMenu'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Text('showModalBottomSheet');
                  },
                );
              },
              child: const Text('showModalBottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now());
              },
              child: const Text('showTimePicker'),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(child: Text('showCupertinoDialog'));
                  },
                );
              },
              child: const Text('showCupertinoDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const Material(child: Text('showGeneralDialog'));
                  },
                );
              },
              child: const Text('showGeneralDialog'),
            ),
          ],
        ),
      ),
    );
  }
}

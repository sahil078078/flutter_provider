import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderEx1HomeScreen extends StatelessWidget {
  const ProviderEx1HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('starts');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IncrementCounters(),
          FloatingActionButton(
            onPressed: () {
              context.read<IncrementDecrement>().increment();
              log('Button is pressed');
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class IncrementDecrement extends ChangeNotifier {
  int _count = 0;

  int get increCount {
    return _count;
  }

  void increment() {
    _count++;
    notifyListeners();
  }
}

class IncrementCounters extends StatelessWidget {
  const IncrementCounters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<IncrementDecrement>().increCount}');
  }
}

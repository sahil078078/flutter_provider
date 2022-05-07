import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProviderEx2HomeScreen extends StatelessWidget {
  const ProviderEx2HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Value');
    int val = Provider.of<IncreDecre>(context).count;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$val",
              style: TextStyle(
                color: Colors.black.withOpacity(0.45),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Provider.of<IncreDecre>(context, listen: false).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                OutlinedButton(
                  onPressed: () {
                    Provider.of<IncreDecre>(context, listen: false).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IncreDecre extends ChangeNotifier {
  int _count = 0;

  int get count {
    return _count;
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }
}

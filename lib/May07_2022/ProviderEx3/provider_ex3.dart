import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderEx3HomeScreen extends StatelessWidget {
  const ProviderEx3HomeScreen({Key? key}) : super(key: key);

  demo(BuildContext context) {
    Provider.of<IncrementDecrement>(context, listen: false).incrementCount();
  }

  @override
  Widget build(BuildContext context) {
    log('Build Method Called');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You get : '),
            MyCounters(),
            SizedBox(width: 20),
            MyConsumerWidget(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<IncrementDecrement>(context, listen: false).count = 1;
            },
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              width: MediaQuery.of(context).size.width * 0.28,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
              ),
              child: const Center(
                  child: Text(
                'ReSet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              )),
            ),
          ),
          const Spacer(),
          Provider.of<IncrementDecrement>(context).count > 0
              ? FloatingActionButton(
                  onPressed: () {
                    Provider.of<IncrementDecrement>(context, listen: false)
                        .decrementCount();
                  },
                  child: const Icon(Icons.remove),
                  backgroundColor: Colors.red.shade300,
                )
              : const SizedBox.shrink(),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: 100,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                  size: 25,
                ),
                const Spacer(),
                Text(
                  Provider.of<IncrementDecrement>(context).count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // demo(context);
              Provider.of<IncrementDecrement>(context, listen: false)
                  .incrementCount();
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green.shade300,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
              ),
              child: const Center(
                child: MyCounters(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncrementDecrement with ChangeNotifier {
  int _count = 1;

  int get count => _count;

  set count(int val) {
    _count = val;
    notifyListeners();
  }

  void incrementCount() {
    _count = _count + 1;
    notifyListeners();
  }

  void decrementCount() {
    if (_count > 0) {
      _count = _count - 1;
      notifyListeners();
    }
  }
}

class MyCounters extends StatelessWidget {
  const MyCounters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<IncrementDecrement>().count.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyConsumerWidget extends StatelessWidget {
  const MyConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IncrementDecrement>(
        // child: const Text("hello"),
        builder: (context, provider, child) {
      return Row(
        children: [
          if (child != null) child,
          Text(provider.count.toString()),
        ],
      );
    });
  }
}

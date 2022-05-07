import 'dart:developer';

import 'package:flutter/material.dart';

class SetStateHomeScreen extends StatefulWidget {
  const SetStateHomeScreen({Key? key}) : super(key: key);

  @override
  State<SetStateHomeScreen> createState() => _SetStateHomeScreenState();
}

class _SetStateHomeScreenState extends State<SetStateHomeScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    log(count.toString());
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.28),
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Icon(Icons.add, color: Colors.green),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      if (count > 0) {
                        count--;
                      }
                    });
                  },
                  child: const Icon(Icons.remove, color: Colors.redAccent),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

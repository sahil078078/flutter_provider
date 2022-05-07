import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'May07_2022/ProviderEx3/provider_ex3.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IncrementDecrement(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderEx3HomeScreen(),
    );
  }
}

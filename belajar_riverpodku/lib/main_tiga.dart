import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ngaranProvider = Provider<String>((ref) {
  return "Nama Saya Fujito";
});

void main(List<String> args) {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ref watch",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ref Watch Riverpod"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "${ref.watch(ngaranProvider)}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

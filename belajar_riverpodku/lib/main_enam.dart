import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final namakuProvider = Provider<String>((ref) {
  return "Namaku: Fakhrul Ramadhan S";
});

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Membaca Provider dengan Widget Consumerstatefulwidget",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final namaku = ref.read(namakuProvider);
    print(namaku);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Membaca Provider dengan widget Consumerstatefulwidget"),
        actions: const [],
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("${ref.watch(namakuProvider)}"),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

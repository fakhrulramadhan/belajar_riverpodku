import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ==== Membaca Ref dengan Widget Consumer===

//provider = utk menyimpan elemen (bisa widget, string biasa, dsj)
//Widget Bukan Tipe Data!!
final namaProvider = Provider<String>((ref) {
  return "Namaku Saeepul";
});

void main(List<String> args) {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Membaca Provider dengan Widget Consumer",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

//kalau di riverpod, consumer widget seperti getbuilder atau stateless
//stateful widget
//consumerwidget = statelesswidget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Membaca Provider dengan Widget Consumer",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Text(
              "${ref.watch(namaProvider)}",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}

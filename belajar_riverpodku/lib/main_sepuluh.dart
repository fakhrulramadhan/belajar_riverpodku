import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final namanyaProvider = Provider<String>((ref) {
  return "Halo, Namanya itu Itik";
});

//streamprovider identik dengan future proovider
final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) => computationCount,
  );
});

void main(List<String> args) {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stream Provider Riverpod",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Rumah(),
    );
  }
}

//consumerwidget (utk ui riverpod) sama aja dengan statelesswidget
class Rumah extends ConsumerWidget {
  const Rumah({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamPodData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stream Provider Riverpod",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //utk refresh, kembali ke awal lagi 0
              ref.invalidate(streamProvider);
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: streamPodData.when(
        data: (data) {
          return Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data.toString()}",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "${ref.watch(namanyaProvider)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(
            "${error}",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

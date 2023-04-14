import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './state_notifier/hitung_notifier.dart';

//state notifier sebagai controllernya

//state..provider<namastatenotifieer, tipedatanya>
final hitungProvider = StateNotifierProvider<HitungNotifier, double>((ref) {
  return HitungNotifier();
});

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State Notifier (Untuk memanggil fungsi)",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Berandaku(),
    );
  }
}

class Berandaku extends ConsumerWidget {
  const Berandaku({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "State Notifier (Untuk memanggil fungsi)",
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(hitungProvider);
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(hitungProvider.notifier).kurang();
                      },
                      icon: const Icon(
                        Icons.minimize,
                        size: 24.0,
                      ),
                      label: Text(
                        "Kurang",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "${ref.watch(hitungProvider)}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(hitungProvider.notifier).tambah();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 24.0,
                      ),
                      label: Text(
                        "Tambah",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(hitungProvider.notifier).bagidua();
                      },
                      icon: const Icon(
                        Icons.minimize,
                        size: 24.0,
                      ),
                      label: Text(
                        "Bagi 2",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(hitungProvider.notifier).kalidua();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 24.0,
                      ),
                      label: Text(
                        "Kali 2",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

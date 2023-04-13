import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//prrovider = bersifat statis
//state provider = nilai provider yang bersifat dinamis
final hitungProvider = StateProvider<int>((ref) {
  return 0;
});

void main(List<String> args) {
  //notifier enggak kepanggil -_- harus pakai scoope
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State Provider",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Berandaku(),
    );
  }
}

//consumerwidget = stateless widget
class Berandaku extends ConsumerWidget {
  const Berandaku({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hitung = ref.watch(hitungProvider);

    //akan muncul sesuatu pada kondisi tertentu
    //sama kayak bloclistener
    //prev = state sebelumnya
    //next = state setelahnya
    ref.listen(hitungProvider, (previous, next) {
      if (next % 2 == 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Dirgahayu Indonesia",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              content: Text(
                "Indonesia Jaya",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            );
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "State Provider",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(hitungProvider); //state yg ada balik lagi ke 0
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      //kalau mau pakai notifier (data dinamis), wrap dulu data
      //provider yang bersifat dinamis
      //pakai consumer
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    "${hitung}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(hitungProvider.notifier).state--;
                        },
                        icon: const Icon(
                          Icons.minimize,
                          size: 24.0,
                        ),
                        label: Text(
                          "Kurang",
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(hitungProvider.notifier).state++;
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                        label: Text(
                          "Tambah",
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

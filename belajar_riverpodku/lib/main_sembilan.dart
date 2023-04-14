import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import './models/pengguna_model.dart';
import './services/api_service.dart';

//tipe datanya api service
final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});

//dieksekusinya nanti (future provider)
final penggunaDataProvider = FutureProvider<List<PenggunaModel>>((ref) async {
  //memanggil fungsi dapatuseer
  return ref.read(apiProvider).dapatUser();
});

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Future Provider API",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Berandaku(),
    );
  }
}

class Berandaku extends ConsumerWidget {
  const Berandaku({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final penggunaData = ref.watch(penggunaDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Future Provider API",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(penggunaDataProvider);
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      //cara panggil data apinya pakai ref.watch(namaprovider).when
      body: penggunaData.when(
        //data = memunculkan data dari API
        //pakai index dulu utk manggilnya
        data: (data) {
          return ListView.builder(
            itemCount:
                data.length, //harus pakai data length agar tidak refresh terus
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  "Nama Peserta ${data[index].namaDepan} ${data[index].namaBelakang}",
                  style: TextStyle(fontSize: 13),
                ),
                subtitle: Text(
                  "Alamat email: ${data[index].email}",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Image.network(
                  "${data[index].avatar}",
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
        //kalau error munculin text error
        error: (error, stackTrace) {
          return Text(
            "${error.toString()}",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          );
        },
        loading: () {
          return Center(
              child: const CircularProgressIndicator(
            color: Colors.orange,
          ));
        },
      ),
    );
  }
}

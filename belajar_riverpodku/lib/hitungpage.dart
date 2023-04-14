import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//state notifier sebagai pengubah data menjadi dinamis
import 'state_notifier/hitung_notifier.dart';

//pakai auto dispose agar data cachingnya bisa balik lagi ke awal
final hitungProvider =
//tipe data notifierrnya harus sama dengan di file hitung_notifier
    StateNotifierProvider.autoDispose<HitungNotifier, double>((ref) {
  //blm ter-autodispose ketika belum 8 detik
  final link = ref.keepAlive();

  //hapus data cache-nya dalam waktu 12 detik
  final timer = Timer(Duration(seconds: 12), () {
    link.close();
  });

  //hapus total cache
  ref.onDispose(() {
    timer.cancel(); //kembalikan durasinya ke seconds: 0 lagi
  });

  return HitungNotifier();
});

class HitungPage extends ConsumerWidget {
  const HitungPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hitung = ref.watch(hitungProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hitung Auto dispose riverpod",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "${hitung}",
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(hitungProvider.notifier).tambah();
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(hitungProvider.notifier).kurang();
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(hitungProvider.notifier).bagidua();
                    },
                    icon: const Icon(
                      Icons.dashboard,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(hitungProvider.notifier).kalidua();
                    },
                    icon: const Icon(
                      Icons.timelapse,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

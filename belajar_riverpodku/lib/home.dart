import 'package:belajar_riverpodku/hitungpage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

//consumerwidget (utk ui di riveerpod)
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Auto dispose Modifier Provider Riverpod",
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 45.0,
          ),
          ElevatedButton.icon(
            onPressed: () {
              //atau pakai  context.push
              //pakai context aja karena pakai go router
              context.push("/hitungpage");
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return HitungPage(); //tampilkan pagenya dengan return
              //   },
              // ));
            },
            icon: const Icon(
              Icons.arrow_right,
              size: 24.0,
            ),
            label: Text(
              "Ke Hitung Page",
              style: TextStyle(
                fontSize: 19.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

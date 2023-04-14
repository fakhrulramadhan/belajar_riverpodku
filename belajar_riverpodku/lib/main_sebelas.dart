import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'home.dart';
import 'hitungpage.dart';

final namaProvider = Provider<String>((ref) {
  return "Diatas Takdir yang berbeda";
});

//utk atur route
final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => Home(),
  ),
  GoRoute(
    path: "/hitungpage",
    builder: (context, state) => HitungPage(),
  )
]);

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //pakai .router karena pakai goroute
    return MaterialApp.router(
      title: "Membaca Provideer yang telah dibuat",
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router, //config router dari _router
    );
  }
}

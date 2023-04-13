import 'package:belajar_riverpodku/main_tujuh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './state_notifier/hitung_notifier.dart';

//state notifier sebagai controllernya

//state..provider<namastatenotifieer, tipedatanya>
final hitungProvider = StateNotifierProvider<HitungNotifier, int>((ref) {
  return HitungNotifier();
});

void main(List<String> args) {
  runApp(const ProviderScope(child: MyApp()));
}

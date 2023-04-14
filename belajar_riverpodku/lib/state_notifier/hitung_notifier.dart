import 'package:flutter_riverpod/flutter_riverpod.dart';

//kalau mau bisa pembagian, tipe datanya harus double
class HitungNotifier extends StateNotifier<double> {
  HitungNotifier() : super(0.0); //kasih nilai awalan 0

  void tambah() {
    state++;
  }

  void kurang() {
    state--;
  }

  void kalidua() {
    state = state * 2;
  }

  void bagidua() {
    state = state / 2;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HitungNotifier extends StateNotifier<int> {
  HitungNotifier() : super(0); //kasih nilai awalan 0

  void tambah() {
    state++;
  }

  void kurang() {
    state--;
  }

  void kalidua() {
    state * 2;
  }

  void bagidua() {
    state / 2;
  }
}

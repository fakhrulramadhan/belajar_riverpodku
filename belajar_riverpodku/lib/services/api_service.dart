import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../models/pengguna_model.dart';

class ApiService {
  String endpoint = "https://reqres.in/api/users?page=2";

  //ambil data modelnya pakai future
  //tipe datanya berupa list
  Future<List<PenggunaModel>> dapatUser() async {
    //cara dapatin response
    Response response = await get(Uri.parse(endpoint));

    //jika status codenya sukses
    if (response.statusCode == 200) {
      //ambil data isiannya (body)
      final List result = jsonDecode(response.body)["data"];

      //melakukan mapping, ubah dari json ke list
      return result.map((e) => PenggunaModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

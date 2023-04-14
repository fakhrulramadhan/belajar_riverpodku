import 'dart:convert';

class PenggunaModel {
  final int id;
  final String email;
  final String namaDepan;
  final String namaBelakang;
  final String avatar;

  //buat constructoor
  PenggunaModel(
      {required this.id,
      required this.email,
      required this.namaDepan,
      required this.namaBelakang,
      required this.avatar});

  //buat factory modeel dari json
  factory PenggunaModel.fromJson(Map<String, dynamic> json) {
    //return dari constructor
    return PenggunaModel(
        id: json['id'],
        email: json['email'],
        namaDepan: json['first_name'],
        namaBelakang: json['last_name'],
        avatar: json['avatar']);
  }
}

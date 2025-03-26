import 'package:encrypt/encrypt.dart';
import 'dart:convert';

class Password {
  String platform="none";
  String username="user";
  String password="pass";
  String secure="";
  static final _key = Key.fromUtf8('1234567890123456'); 
  static final _iv = IV.fromLength(16); 

  void encrypt() {
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(password, iv: _iv);
    secure= base64Encode(encrypted.bytes);
  }

}
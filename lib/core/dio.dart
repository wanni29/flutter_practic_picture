import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// dio를 통한  http통신하기
final dio = Dio(
  BaseOptions(
    baseUrl: 'http://0.0.0.0:8080',
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬 스토리지에 저장하는 공간
const secureStorage = FlutterSecureStorage();

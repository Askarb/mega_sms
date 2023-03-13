import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/bloc/auth_bloc.dart';
import 'package:flutter_application_1/models/auth_model.dart';

import 'models/code_model.dart';

class Repo {
  final Dio dio;

  Repo({required this.dio});
  Future<AuthModel> sendPhone(String number) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('testEmil12:11223344'));
    final response = await dio.get(
      '/kp-auth/auth/generateUserId/test',
      queryParameters: {'msisdn': number},
      options: Options(
        headers: {'authorization': basicAuth},
      ),
    );
    return AuthModel.fromJson(response.data);
  }

  Future<CodeModel> sendCode(String code, String uuId) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('testEmil12:11223344'));
    final response = await dio.get(
      'https://app1.megacom.kg:9090/kp-auth/auth/checkCode/test',
      queryParameters: {'code': code, 'uuId': uuId},
      options: Options(
        headers: {'authorization': basicAuth},
      ),
    );
    return CodeModel.fromJson(response.data);
  }
}

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../Helpers/BaseServerUrl.dart';


class PersonalController {
  String server = baseServerUrl;

  final secureStorage = FlutterSecureStorage();

  Future<PersonalInformationResponse> getPersonalInformation() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/get-personal-information'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return PersonalInformationResponse.fromJson(jsonDecode(resp.body));
  }
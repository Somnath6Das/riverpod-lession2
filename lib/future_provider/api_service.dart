import 'dart:convert';

import 'package:riverpod_lesson2/future_provider/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String endPoint = "https://somnath6das.github.io/api/future-provider.json";

  Future<List<ApiModel>> getUsers() async {
    final response = await http.get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => ApiModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

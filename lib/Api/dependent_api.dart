import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/dependent.dart';
import 'package:insurview360/configs.dart';

class DependentApi {
  Future<Dependent> fetchDependent(String dependentId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/dependent/$dependentId'),
    );

    if (response.statusCode == 200) {
      return Dependent.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load dependent');
    }
  }

  Future<List<Dependent>> fetchDependents() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/dependent'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((dependent) => Dependent.fromMap(dependent))
          .toList();
    } else {
      throw Exception('Failed to load dependents');
    }
  }

  Future<void> createDependent(Dependent dependent) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/dependent'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dependent.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create dependent');
    }
  }

  Future<void> updateDependent(Dependent dependent) async {
    final response = await http.put(
      Uri.parse('$apiUrl/api/dependent/${dependent.dependentId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dependent.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update dependent');
    }
  }

  Future<void> deleteDependent(String dependentId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/api/dependent/$dependentId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete dependent');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/policy.dart';
import 'package:insurview360/configs.dart';

class PolicyApi {
  Future<Policy> fetchPolicy(String policyId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/policy/$policyId'),
    );

    if (response.statusCode == 200) {
      return Policy.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load policy');
    }
  }

  Future<List<Policy>> fetchPolicies() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/policy'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((policy) => Policy.fromMap(policy)).toList();
    } else {
      throw Exception('Failed to load policies');
    }
  }

  Future<void> createPolicy(Policy policy) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/policy'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(policy.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create policy');
    }
  }

  Future<void> updatePolicy(Policy policy) async {
    final response = await http.put(
      Uri.parse('$apiUrl/api/policy/${policy.policyId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(policy.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update policy');
    }
  }

  Future<void> deletePolicy(String policyId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/api/policy/$policyId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete policy');
    }
  }
}

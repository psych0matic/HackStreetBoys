import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/advisor.dart';

class AdvisorApi {
  Future<Advisor> fetchAdvisor(String advisorId) async {
    final response = await http.get(
      Uri.parse('https://api.example.com/advisors/$advisorId'),
    );

    if (response.statusCode == 200) {
      return Advisor.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load advisor');
    }
  }

  Future<List<Advisor>> fetchAdvisors() async {
    final response = await http.get(
      Uri.parse('https://api.example.com/advisors'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((advisor) => Advisor.fromMap(advisor)).toList();
    } else {
      throw Exception('Failed to load advisors');
    }
  }

  Future<void> createAdvisor(Advisor advisor) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/advisors'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(advisor.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create advisor');
    }
  }

  Future<void> updateAdvisor(Advisor advisor) async {
    final response = await http.put(
      Uri.parse('https://api.example.com/advisors/${advisor.advisorId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(advisor.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update advisor');
    }
  }

  Future<void> deleteAdvisor(String advisorId) async {
    final response = await http.delete(
      Uri.parse('https://api.example.com/advisors/$advisorId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete advisor');
    }
  }
}

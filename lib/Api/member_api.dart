import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/member.dart';
import 'package:insurview360/configs.dart';

class MemberApi {
  Future<Member> fetchMember(String memberId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/member/$memberId'),
    );

    if (response.statusCode == 200) {
      return Member.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load member');
    }
  }

  Future<List<Member>> fetchMembers() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/member/'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((member) => Member.fromMap(member)).toList();
    } else {
      throw Exception('Failed to load members');
    }
  }

  Future<void> createMember(Member member) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/member/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(member.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create member');
    }
  }

  Future<void> updateMember(Member member) async {
    final response = await http.put(
      Uri.parse('$apiUrl/api/member/${member.memberId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(member.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update customer');
    }
  }

  Future<void> deleteMember(String memberId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/api/member/$memberId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete member');
    }
  }
}

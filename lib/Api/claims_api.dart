import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/claim.dart';
import 'package:insurview360/configs.dart';

class ClaimsApi {
  Future<Claim> fetchClaim(String claimId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/claim/$claimId'),
    );

    if (response.statusCode == 200) {
      return Claim.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load claim');
    }
  }

  Future<List<Claim>> fetchClaims() async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/claim'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((claim) => Claim.fromMap(claim)).toList();
    } else {
      throw Exception('Failed to load claims');
    }
  }

  Future<void> createClaim(Claim claim) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/claim'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(claim.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create claim');
    }
  }

  Future<void> updateClaim(Claim claim) async {
    final response = await http.put(
      Uri.parse('$apiUrl/api/claim/${claim.claimId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(claim.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update claim');
    }
  }

  Future<void> deleteClaim(String claimId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/api/claim/$claimId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete claim');
    }
  }
}

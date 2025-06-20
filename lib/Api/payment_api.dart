import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/payment.dart';
import 'package:insurview360/configs.dart';

class PaymentApi {
  Future<Payment> fetchPayment(String paymentId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/api/payment/$paymentId'),
    );

    if (response.statusCode == 200) {
      return Payment.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load payment');
    }
  }

  Future<List<Payment>> fetchPayments() async {
    final response = await http.get(Uri.parse('$apiUrl/api/payment'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((payment) => Payment.fromMap(payment)).toList();
    } else {
      throw Exception('Failed to load payments');
    }
  }

  Future<void> createPayment(Payment payment) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/payment'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payment.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create payment');
    }
  }

  Future<void> updatePayment(Payment payment) async {
    final response = await http.put(
      Uri.parse('$apiUrl/api/payment/${payment.paymentId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payment.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update payment');
    }
  }

  Future<void> deletePayment(String paymentId) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/api/payment/$paymentId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete payment');
    }
  }
}

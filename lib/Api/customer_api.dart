import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurview360/Models/customer.dart';

class CustomerApi {
  Future<Customer> fetchCustomer(String customerId) async {
    final response = await http.get(
      Uri.parse('https://api.example.com/customers/$customerId'),
    );

    if (response.statusCode == 200) {
      return Customer.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load customer');
    }
  }

  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(
      Uri.parse('https://api.example.com/customers'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((customer) => Customer.fromMap(customer))
          .toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  Future<void> createCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(customer.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create customer');
    }
  }

  Future<void> updateCustomer(Customer customer) async {
    final response = await http.put(
      Uri.parse('https://api.example.com/customers/${customer.customerId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(customer.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update customer');
    }
  }

  Future<void> deleteCustomer(String customerId) async {
    final response = await http.delete(
      Uri.parse('https://api.example.com/customers/$customerId'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete customer');
    }
  }
}

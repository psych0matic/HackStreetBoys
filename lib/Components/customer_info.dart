import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final conCustomerId = TextEditingController();
  final conFirstName = TextEditingController();
  final conLastName = TextEditingController();
  final conEmail = TextEditingController();
  final conPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(color: Colors.blueAccent, width: 50, height: 50),
              Expanded(child: Text("Customer Information")),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: conCustomerId,
                  decoration: InputDecoration(labelText: 'Customer ID'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conFirstName,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conLastName,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: conEmail,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conPhone,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

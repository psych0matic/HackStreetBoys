import 'package:flutter/material.dart';

class AdvisorInfo extends StatefulWidget {
  const AdvisorInfo({super.key});

  @override
  State<AdvisorInfo> createState() => _AdvisorInfoState();
}

class _AdvisorInfoState extends State<AdvisorInfo> {
  final conAgentId = TextEditingController();
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
              Container(color: Colors.purpleAccent, width: 50, height: 50),
              Expanded(child: Text("Advisor Information")),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: conAgentId,
                  decoration: InputDecoration(labelText: 'Agent ID'),
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

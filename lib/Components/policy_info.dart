import 'package:flutter/material.dart';

class PolicyInfo extends StatefulWidget {
  const PolicyInfo({super.key});

  @override
  State<PolicyInfo> createState() => _PolicyInfoState();
}

class _PolicyInfoState extends State<PolicyInfo> {
  final conPolicyId = TextEditingController();
  final conPolicyNumber = TextEditingController();
  final conPolicyType = TextEditingController();
  final conStartDate = TextEditingController();
  final conEndDate = TextEditingController();
  final conStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(color: Colors.lightGreen, width: 50, height: 50),
              Expanded(child: Text("Policy Information")),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: conPolicyId,
                  decoration: InputDecoration(labelText: 'Policy ID'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conPolicyNumber,
                  decoration: InputDecoration(labelText: 'Policy Number'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conPolicyType,
                  decoration: InputDecoration(labelText: 'Policy Type'),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: conStartDate,
                  decoration: InputDecoration(labelText: 'Start Date'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: conEndDate,
                  decoration: InputDecoration(labelText: 'End Date'),
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: conStatus.text.isNotEmpty ? conStatus.text : null,
                  decoration: InputDecoration(labelText: 'Status'),
                  items:
                      ['Active', 'Inactive', 'Pending']
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      conStatus.text = value ?? '';
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

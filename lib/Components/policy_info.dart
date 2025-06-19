import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/policy_api.dart';
import 'package:insurview360/Models/policy.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                "Policy Information",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: FilledButton(
                child: Text("Save"),
                onPressed: () async {
                  Policy policy = Policy(
                    policyId: conPolicyId.text,
                    policyNumber: conPolicyNumber.text,
                    policyType: conPolicyType.text,
                    startDate:
                        DateTime.tryParse(conStartDate.text) ?? DateTime.now(),
                    endDate:
                        DateTime.tryParse(conEndDate.text) ?? DateTime.now(),
                    status: PolicyStatus.values.firstWhere(
                      (e) => e.toString().split('.').last == conStatus.text,
                      orElse: () => PolicyStatus.values.first,
                    ),
                  );

                  await PolicyApi().updatePolicy(policy);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conPolicyId,
                    decoration: InputDecoration(
                      labelText: 'Policy ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conPolicyNumber,
                    decoration: InputDecoration(
                      labelText: 'Policy Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conPolicyType,
                    decoration: InputDecoration(
                      labelText: 'Policy Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conStartDate,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conEndDate,
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    value: conStatus.text.isNotEmpty ? conStatus.text : null,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                    items: ['Active', 'Inactive', 'Pending']
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
      ),
    );
  }
}

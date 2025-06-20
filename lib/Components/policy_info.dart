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
  final conMemberId = TextEditingController();
  final conTestId = TextEditingController();

  List<Policy> policies = [];
  Policy? policy;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
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
                  ),
                ),
                FilledButton(
                  child: Text("Get one"),
                  onPressed: () async {
                    policies = await PolicyApi().fetchPolicies();

                    if (policies.isNotEmpty) {
                      setState(() {
                        Policy policy = (policies..shuffle()).first;
                        conPolicyId.text = policy.policyId;
                        conPolicyNumber.text = policy.policyNumber ?? '';
                        conPolicyType.text = policy.policyType ?? '';
                        conStartDate.text = policy.startDate!.toIso8601String();
                        conEndDate.text = policy.endDate!.toIso8601String();
                        conStatus.text = policy.status ?? "";
                        conMemberId.text = policy.memberId ?? '';
                      });
                    }
                  },
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: conTestId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                      labelText: 'ID',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Get by ID Button
                FilledButton(
                  child: Text("Get by Policy ID"),
                  onPressed: () async {
                    policy = await PolicyApi().fetchPolicy(conTestId.text);

                    if (policy != null) {
                      setState(() {
                        Policy p = policy!;
                        conPolicyId.text = p.policyId;
                        conPolicyNumber.text = p.policyNumber ?? '';
                        conPolicyType.text = p.policyType ?? '';
                        conStartDate.text = p.startDate!.toIso8601String();
                        conEndDate.text = p.endDate!.toIso8601String();
                        conStatus.text = p.status ?? '';
                      });
                    }
                  },
                ),
              ],
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
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conStatus,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
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

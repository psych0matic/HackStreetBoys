import 'package:flutter/material.dart';
import 'package:insurview360/Components/advisor_info.dart';
import 'package:insurview360/Components/claims_history.dart';
import 'package:insurview360/Components/customer_info.dart';
import 'package:insurview360/Components/policy_info.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Customer Policy Dashboard'),
                subtitle: const Text(
                  'Complete overview of policy information and related details ',
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomerInfo(),
            PolicyInfo(),
            AdvisorInfo(),
            ClaimsHistory(),
          ],
        ),
      ),
    );
  }
}

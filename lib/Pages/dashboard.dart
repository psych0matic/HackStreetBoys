import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Components/advisor_info.dart';
import 'package:insurview360/Components/claims_history.dart';
import 'package:insurview360/Components/customer_info.dart';
import 'package:insurview360/Components/payment_history.dart';
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
        child: Center(
          child: SizedBox(
            width: 900,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(
                        'Customer Policy Dashboard',
                        style: GoogleFonts.roboto(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Complete overview of policy information and related details ',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomerInfo(),
                PolicyInfo(),
                AdvisorInfo(),
                ClaimsHistory(),
                PaymentHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

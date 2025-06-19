import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Models/payment.dart';
import 'package:intl/intl.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final formatter = NumberFormat.currency(symbol: 'R', decimalDigits: 2);

  final List<Payment> payments = [
    Payment(
      paymentId: 'P001',
      policyId: 'POL123',
      paymentDate: DateTime.now(),
      amount: Decimal.parse('100.00'),
    ),
    Payment(
      paymentId: 'P002',
      policyId: 'POL456',
      paymentDate: DateTime.now().subtract(Duration(days: 30)),
      amount: Decimal.parse('200.00'),
    ),
  ];

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
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                "Payment History",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            DataTable(
              columns: const [
                DataColumn(
                  label: Text('Payment ID'),
                  columnWidth: FlexColumnWidth(0.25),
                ),
                DataColumn(
                  label: Text('Policy ID'),
                  columnWidth: FlexColumnWidth(0.25),
                ),
                DataColumn(
                  label: Text('Payment Date'),
                  columnWidth: FlexColumnWidth(0.25),
                ),
                DataColumn(
                  label: Text('Amount'),
                  columnWidth: FlexColumnWidth(0.25),
                ),
              ],
              rows: payments.map((payment) {
                return DataRow(
                  cells: [
                    DataCell(Text(payment.paymentId)),
                    DataCell(Text(payment.policyId)),
                    DataCell(
                      Text(DateFormat("dd MMM y").format(payment.paymentDate)),
                    ),
                    DataCell(Text(formatter.format(payment.amount.toDouble()))),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:insurview360/Models/payment.dart';
import '../Models/claim.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
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
      child: Column(
        children: [
          Row(
            children: [
              Container(color: Colors.purpleAccent, width: 50, height: 50),
              Expanded(child: Text("Claims History")),
            ],
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Payment ID')),
              DataColumn(label: Text('Policy ID')),
              DataColumn(label: Text('Payment Date')),
              DataColumn(label: Text('Amount')),
            ],
            rows:
                payments.map((payment) {
                  return DataRow(
                    cells: [
                      DataCell(Text(payment.paymentId)),
                      DataCell(Text(payment.policyId)),
                      DataCell(Text(payment.paymentDate.toIso8601String())),
                      DataCell(Text(payment.amount.toString())),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

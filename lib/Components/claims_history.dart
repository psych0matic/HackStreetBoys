import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import '../Models/claim.dart';

class ClaimsHistory extends StatefulWidget {
  const ClaimsHistory({super.key});

  @override
  State<ClaimsHistory> createState() => _ClaimsHistoryState();
}

class _ClaimsHistoryState extends State<ClaimsHistory> {
  final List<Claim> claims = [
    Claim(
      claimId: 'C123',
      policyId: 'P456',
      claimDate: DateTime(2023, 1, 15),
      status: ClaimStatus.Approved,
      amount: Decimal.parse('1500.00'),
    ),
    Claim(
      claimId: 'C124',
      policyId: 'P457',
      claimDate: DateTime(2023, 2, 20),
      status: ClaimStatus.Pending,
      amount: Decimal.parse('2500.00'),
    ),
    Claim(
      claimId: 'C125',
      policyId: 'P458',
      claimDate: DateTime(2023, 3, 10),
      status: ClaimStatus.Denied,
      amount: Decimal.parse('1000.00'),
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
              DataColumn(label: Text('Claim ID')),
              DataColumn(label: Text('Policy ID')),
              DataColumn(label: Text('Claim Date')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Amount')),
            ],
            rows:
                claims.map((claim) {
                  return DataRow(
                    cells: [
                      DataCell(Text(claim.claimId)),
                      DataCell(Text(claim.policyId)),
                      DataCell(Text(claim.claimDate.toIso8601String())),
                      DataCell(Text(claim.status.toString().split('.').last)),
                      DataCell(Text(claim.amount.toString())),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}

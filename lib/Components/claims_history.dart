import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Models/claim.dart';

class ClaimsHistory extends StatefulWidget {
  const ClaimsHistory({super.key});

  @override
  State<ClaimsHistory> createState() => _ClaimsHistoryState();
}

class _ClaimsHistoryState extends State<ClaimsHistory> {
  final formatter = NumberFormat.currency(symbol: 'R', decimalDigits: 2);

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                "Claims History",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 700,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Claim ID'),
                    columnWidth: FlexColumnWidth(0.2),
                  ),
                  DataColumn(
                    label: Text('Policy ID'),
                    columnWidth: FlexColumnWidth(0.2),
                  ),
                  DataColumn(
                    label: Text('Claim Date'),
                    columnWidth: FlexColumnWidth(0.2),
                  ),
                  DataColumn(
                    label: Text('Status'),
                    columnWidth: FlexColumnWidth(0.2),
                  ),
                  DataColumn(
                    label: Text('Amount'),
                    columnWidth: FlexColumnWidth(0.2),
                  ),
                ],
                rows: claims.map((claim) {
                  return DataRow(
                    cells: [
                      DataCell(Text(claim.claimId)),
                      DataCell(Text(claim.policyId)),
                      DataCell(
                        Text(DateFormat("dd MMM y").format(claim.claimDate)),
                      ),
                      DataCell(Text(claim.status.toString().split('.').last)),
                      DataCell(Text(formatter.format(claim.amount.toDouble()))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

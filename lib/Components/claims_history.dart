import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/claims_api.dart';
import 'package:intl/intl.dart';
import '../Models/claim.dart';

class ClaimsHistory extends StatefulWidget {
  const ClaimsHistory({super.key});

  @override
  State<ClaimsHistory> createState() => _ClaimsHistoryState();
}

class _ClaimsHistoryState extends State<ClaimsHistory> {
  final formatter = NumberFormat.currency(symbol: 'R', decimalDigits: 2);

  List<Claim> claims = [];
  Claim? claim;

  final conClaimId = TextEditingController();
  final conMemberId = TextEditingController();
  final conPolicyId = TextEditingController();
  final conClaimDate = TextEditingController();
  final conAmount = TextEditingController();
  final conStatus = TextEditingController();
  final conReason = TextEditingController();
  final conTestId = TextEditingController();

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
                ),
                FilledButton(
                  child: Text("Get one"),
                  onPressed: () async {
                    claims = await ClaimsApi().fetchClaims();

                    if (claims.isNotEmpty) {
                      setState(() {
                        Claim claim = (claims..shuffle()).first;
                        // Assuming Claim has properties like claimId, memberId, policyId, claimDate, amount
                        conClaimId.text = claim.claimId;
                        conMemberId.text = claim.memberId;
                        conPolicyId.text = claim.policyId;
                        conClaimDate.text = claim.claimDate.toIso8601String();
                        conAmount.text = claim.amount.toString();
                        conStatus.text = claim.status;

                        conReason.text = claim.reason;
                      });
                    }
                  },
                ),

                SizedBox(width: 10),
                SizedBox(
                  width: 100,
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
                  child: Text("Get by Claim ID"),
                  onPressed: () async {
                    claim = await ClaimsApi().fetchClaim(conTestId.text);

                    if (claim != null) {
                      setState(() {
                        Claim c = claim!;
                        conClaimId.text = c.claimId;
                        conMemberId.text = c.memberId;
                        conPolicyId.text = c.policyId;
                        conClaimDate.text = c.claimDate.toIso8601String();
                        conAmount.text = c.amount.toString();
                        conStatus.text = c.status;
                        conReason.text = c.reason;
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
                    controller: conClaimId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                      labelText: 'Claim ID',
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                    controller: conMemberId,
                    decoration: InputDecoration(
                      labelText: 'Member ID',
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
                    controller: conClaimDate,
                    decoration: InputDecoration(
                      labelText: 'Claim Date',
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
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conAmount,
                    decoration: InputDecoration(
                      labelText: 'Amount',
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
                    controller: conReason,
                    decoration: InputDecoration(
                      labelText: 'Reason',
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

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/payment_api.dart';
import 'package:insurview360/Api/policy_api.dart';
import 'package:insurview360/Models/payment.dart';
import 'package:intl/intl.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final formatter = NumberFormat.currency(symbol: 'R', decimalDigits: 2);

  final conMemberId = TextEditingController();
  final conPaymentId = TextEditingController();
  final conPaymentDate = TextEditingController();
  final conPolicyId = TextEditingController();
  final conAmount = TextEditingController();
  List<Payment> payments = [];

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
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    title: Text(
                      "Payments",
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
                    payments = await PaymentApi().fetchPayments();

                    if (payments.isNotEmpty) {
                      setState(() {
                        Payment payment = (payments..shuffle()).first;
                        conPaymentId.text = payment.paymentId;
                        conMemberId.text = payment.memberId;
                        conPolicyId.text = payment.policyId;
                        conPaymentDate.text = DateFormat(
                          'dd MM y',
                        ).format(payment.paymentDate);
                        conAmount.text = formatter.format(
                          payment.amount.toDouble(),
                        );
                      });
                    }
                  },
                ),

                // Save Button
                // FilledButton(
                //   child: Text("Save"),
                //   onPressed: () async {
                //     Payment payment = Payment(
                //       paymentId: conPaymentId.text,
                //       memberId: conMemberId.text,
                //       policyId: conPolicyId.text,
                //       paymentDate: DateTime.parse(conPaymentDate.text),
                //       amount: Decimal.parse(
                //         conAmount.text.replaceAll('R', '').replaceAll(',', ''),
                //       ),
                //     );

                //     await PaymentApi().updatePayment(payment);
                //   },
                // ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conPaymentId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                      labelText: 'Payment ID',
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
                    controller: conPaymentDate,
                    decoration: InputDecoration(
                      labelText: 'Payment Date',
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
          ],
        ),
      ),
    );
  }
}

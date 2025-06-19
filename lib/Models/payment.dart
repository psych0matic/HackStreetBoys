import 'package:decimal/decimal.dart';

class Payment {
  final String paymentId;
  final String policyId;
  final DateTime paymentDate;
  final Decimal amount;

  Payment({
    required this.paymentId,
    required this.policyId,
    required this.paymentDate,
    required this.amount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['paymentId'] as String,
      policyId: json['policyId'] as String,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      amount: Decimal.parse(json['amount'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'policyId': policyId,
      'paymentDate': paymentDate.toIso8601String(),
      'amount': amount.toString(),
    };
  }
}
import 'package:decimal/decimal.dart';

enum ClaimStatus { Pending, Denied, Approved }

class Claim {
  String claimId;
  String policyId;
  DateTime claimDate;
  ClaimStatus status;
  Decimal amount;

  Claim({
    required this.claimId,
    required this.policyId,
    required this.claimDate,
    required this.status,
    required this.amount,
  });

  // Method to convert a Claim object to a Map
  Map<String, dynamic> toMap() {
    return {
      'claimId': claimId,
      'policyId': policyId,
      'claimDate': claimDate.toIso8601String(),
      'status': status.toString().split('.').last,
      'amount': amount.toString(),
    };
  }

  // Factory constructor to create a Claim object from a Map
  factory Claim.fromMap(Map<String, dynamic> map) {
    return Claim(
      claimId: map['claimId'] ?? '',
      policyId: map['policyId'] ?? '',
      claimDate: DateTime.parse(
        map['claimDate'] ?? DateTime.now().toIso8601String(),
      ),
      status: ClaimStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
        orElse: () => ClaimStatus.Pending,
      ),
      amount: Decimal.parse(map['amount'] ?? '0.0'),
    );
  }
}

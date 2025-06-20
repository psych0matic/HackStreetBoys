import 'package:decimal/decimal.dart';

enum ClaimStatus { Pending, Denied, Approved }

class Claim {
  String claimId;
  String policyId;
  DateTime claimDate;
  String status;
  Decimal amount;
  String reason;
  String memberId;

  Claim({
    required this.claimId,
    required this.policyId,
    required this.claimDate,
    required this.status,
    required this.amount,
    required this.reason,
    required this.memberId,
  });

  // Method to convert a Claim object to a Map
  Map<String, dynamic> toMap() {
    return {
      'claimId': claimId,
      'policyId': policyId,
      'claimDate': claimDate.toIso8601String(),
      'status': status,
      'amount': amount.toString(),
      'reason': reason,
      'memberId': memberId,
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
      status: map['status'] ?? 'Pending',
      amount: Decimal.parse(map['amount'] ?? '0.0'),
      reason: map['reason'] ?? '',
      memberId: map['memberId'] ?? '',
    );
  }
}

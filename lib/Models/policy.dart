enum PolicyStatus {
  Active,
  Inactive,
}

class Policy {
  final String policyId;
  final String? policyNumber;
  final String? policyType;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final String? memberId;

  Policy({
    required this.policyId,
    this.policyNumber,
    this.policyType,
    this.startDate,
    this.endDate,
    this.status,
    this.memberId
  });

  @override
  String toString() {
    return 'Policy(policyId: $policyId, policyNumber: $policyNumber, policyType: $policyType, startDate: $startDate, endDate: $endDate, status: $status)';
  }

  // Convert Policy to Map
  Map<String, dynamic> toMap() {
    return {
      'policyId': policyId,
      'policyNumber': policyNumber,
      'policyType': policyType,
      'startDate': startDate!.toIso8601String(),
      'endDate': endDate!.toIso8601String(),
      'status': status, // Convert enum to string
      'memberId': memberId,
    };
  }

  // Create Policy from Map
  factory Policy.fromMap(Map<String, dynamic> map) {
    return Policy(
      policyId: map['policyId'],
      policyNumber: map['policyNumber'],
      policyType: map['policyType'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      status: map['status'],
      memberId: map['memberId'],
    );
  }
}
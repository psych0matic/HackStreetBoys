enum PolicyStatus {
  Active,
  Inactive,
}

class Policy {
  final String policyId;
  final String policyNumber;
  final String policyType;
  final DateTime startDate;
  final DateTime endDate;
  final PolicyStatus status;

  Policy({
    required this.policyId,
    required this.policyNumber,
    required this.policyType,
    required this.startDate,
    required this.endDate,
    required this.status,
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
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status.toString().split('.').last, // Convert enum to string
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
      status: PolicyStatus.values.firstWhere(
        (e) => e.toString().split('.').last == map['status'],
      ),
    );
  }
}
class Dependent {
  final String dependentId;
  final String memberId;
  final String firstName;
  final String lastName;
  final String relation;

  Dependent({
    required this.dependentId,
    required this.memberId,
    required this.firstName,
    required this.lastName,
    required this.relation,
  });

  factory Dependent.fromMap(Map<String, dynamic> map) {
    return Dependent(
      dependentId: map['dependentId'] as String,
      memberId: map['memberId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      relation: map['relation'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dependentId': dependentId,
      'customerId': memberId,
      'firstName': firstName,
      'lastName': lastName,
      'relation': relation,
    };
  }
}
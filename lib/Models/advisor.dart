class Advisor {
  final String advisorId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  Advisor({
    required this.advisorId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'agentId': advisorId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory Advisor.fromMap(Map<String, dynamic> map) {
    return Advisor(
      advisorId: map['agentId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Agent(agentId: $advisorId, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber)';
  }
}
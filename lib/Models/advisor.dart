class Agent {
  final String agentId;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  Agent({
    required this.agentId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'agentId': agentId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory Agent.fromMap(Map<String, dynamic> map) {
    return Agent(
      agentId: map['agentId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Agent(agentId: $agentId, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber)';
  }
}
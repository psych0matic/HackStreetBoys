class Member {
  String memberId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? employer;
  String? employmentStatus;

  Member({
    required this.memberId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.employer,
    this.employmentStatus,
  });

  // Method to convert a Customer object to a Map
  Map<String, dynamic> toMap() {
    return {
      'memberId': memberId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'employer': employer,
      'employmentStatus': employmentStatus,
    };
  }

  // Factory constructor to create a Customer object from a Map
  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      memberId: map['memberId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      employer: map['employer'] ?? '',
      employmentStatus: map['employmentStatus'] ?? '',
    );
  }
}

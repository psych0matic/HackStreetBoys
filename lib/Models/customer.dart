class Customer {
  String customerId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  Customer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  // Method to convert a Customer object to a Map
  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  // Factory constructor to create a Customer object from a Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      customerId: map['customerId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }
}
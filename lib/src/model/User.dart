class UserDetails {
  String lastName;
  String firstName;
  String email;
  String role;

  UserDetails(
      {required this.lastName,
      required this.firstName,
      required this.email,
      required this.role});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        role: json['role']);
  }

  Map<String, dynamic> toJSON() => {
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'role': role,
      };
}



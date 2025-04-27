class UserEntities {
  final String uuid;
  final String firstName;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final String password;
  final String email;
  final List<String> roles;
  final bool skillOccupation ;
  final String biography;
  final String registrationData;

  UserEntities({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.roles,
    required this.skillOccupation,
    required this.biography,
    required this.registrationData,
  });
}

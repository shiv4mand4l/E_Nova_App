class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

abstract class AuthEvent {
  AuthEvent();
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent({required this.username, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

class AuthOtpVerificationEvent extends AuthEvent {
  final String otp;
  final String userId;

  AuthOtpVerificationEvent({required this.otp,required  this.userId});
}

class AuthRefreshTokenEvent extends AuthEvent {
  final String refreshToken;
  AuthRefreshTokenEvent({required this.refreshToken});
}

class AuthRegisterEmailEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String password;
  final String email;

  AuthRegisterEmailEvent({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
  });
}

class AuthRegisterPhoneEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String password;
  final String phoneNumber;

  AuthRegisterPhoneEvent({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
  });
}

class AuthResetPasswordEmailEvent extends AuthEvent {
  final String email;

  AuthResetPasswordEmailEvent({required this.email});
}

class AuthResetPasswordPhoneEvent extends AuthEvent {
  final String phone;

  AuthResetPasswordPhoneEvent({required this.phone});
}

class AuthGrandCodeEvent extends AuthEvent {
  final String code;

  AuthGrandCodeEvent({required this.code});
}

class AuthResetPasswordEvent extends AuthEvent {
  final String otp;
  final List<String> newPassword;
  final List<String> confirmPassword;

  AuthResetPasswordEvent({
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });
}

abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

  class OtpVerificationsLoading extends OtpVerificationState {}

class OtpVerificationsSuccess extends OtpVerificationState {
  final String message;
  OtpVerificationsSuccess({required this.message});
}

class OtpVerificationsError extends OtpVerificationState {
  final String message;
  OtpVerificationsError({required this.message});
}

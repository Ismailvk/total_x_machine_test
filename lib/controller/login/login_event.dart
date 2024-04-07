part of 'login_bloc.dart';

sealed class LoginEvent {}

final class GetOptEvent extends LoginEvent {
  final String phoneNumber;

  GetOptEvent({required this.phoneNumber});
}

final class VerifyButtonEvent extends LoginEvent {
  final String otp;
  final String vid;
  VerifyButtonEvent({required this.otp, required this.vid});
}
